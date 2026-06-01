import { useEffect, useRef, useState } from 'react';
import flatpickr from 'flatpickr';
import 'flatpickr/dist/flatpickr.min.css';
import { Catalan } from 'flatpickr/dist/l10n/cat.js';
import { getAvailableTables } from '../services/fetching';

export default function Fase1({ comensales, setComensales, fecha, setFecha, turno, setTurno, setFase, setMesasDisponibles }) {
  const [fechasRapidas, setFechasRapidas] = useState([]);
  const [mostrarCalendario, setMostrarCalendario] = useState(false);
  const [mostrarAviso, setMostrarAviso] = useState(false);
  const [isLoading, setIsLoading] = useState(false);
  const flatpickrRef = useRef(null);
  const dateInputRef = useRef(null);

  useEffect(() => {
    const diasSemana = ['DIUM.', 'DILL.', 'DIM.', 'DIM.', 'DIJ.', 'DIV.', 'DISS.'];
    const meses = ['GEN', 'FEBR', 'MARÇ', 'ABR', 'MAIG', 'JUNY', 'JUL', 'AGOST', 'SET', 'OCT', 'NOV', 'DES'];
    const fechas = [];
    
    let daysChecked = 0;
    const todayStr = new Date().toDateString();
    
    while (fechas.length < 6) {
      const f = new Date();
      f.setDate(f.getDate() + daysChecked);
      const dayOfWeek = f.getDay();
      
      // Monday (1) and Tuesday (2) are closed
      if (dayOfWeek !== 1 && dayOfWeek !== 2) {
        const isToday = f.toDateString() === todayStr;
        const diaTexto = isToday ? 'AVUI' : diasSemana[dayOfWeek];
        const diaNum = f.getDate();
        const mesTexto = meses[f.getMonth()];
        const fechaISO = new Date(f.getTime() - (f.getTimezoneOffset() * 60000)).toISOString().split('T')[0];
        
        fechas.push({ diaTexto, diaNum, mesTexto, fechaISO });
      }
      daysChecked++;
    }
    
    setFechasRapidas(fechas);
    if (!fecha) setFecha(fechas[0].fechaISO);

    if (dateInputRef.current) {
      flatpickrRef.current = flatpickr(dateInputRef.current, {
        locale: Catalan,
        minDate: 'today',
        maxDate: new Date().setMonth(new Date().getMonth() + 4),
        disableMobile: true,
        disable: [
          function(date) {
            // Disable Monday (1) and Tuesday (2)
            return date.getDay() === 1 || date.getDay() === 2;
          }
        ],
        onChange: (selectedDates, dateStr) => {
          if (dateStr) setFecha(dateStr);
        }
      });
    }
    return () => flatpickrRef.current && flatpickrRef.current.destroy();
  }, []);

  const handleComensales = (val) => {
    if (val === '') {
      setComensales('');
      setMostrarAviso(false);
      return;
    }
    const num = parseInt(val, 10);
    if (isNaN(num)) return;
    if (num > 8) {
      setComensales(8);
      setMostrarAviso(true);
    } else {
      setComensales(num);
      setMostrarAviso(false);
    }
  };

  const handleBlur = () => {
    const num = parseInt(comensales, 10);
    if (isNaN(num) || num < 1) {
      setComensales(1);
    } else if (num > 8) {
      setComensales(8);
      setMostrarAviso(true);
    } else {
      setComensales(num);
    }
  };

  const handleDecrement = () => {
    const current = parseInt(comensales, 10) || 1;
    let next = current - 1;
    if (next < 1) next = 1;
    setComensales(next);
    setMostrarAviso(false);
  };

  const handleIncrement = () => {
    const current = parseInt(comensales, 10) || 1;
    let next = current + 1;
    if (next > 8) {
      setComensales(8);
      setMostrarAviso(true);
    } else {
      setComensales(next);
      setMostrarAviso(false);
    }
  };

  const handleKeyDown = (e) => {
    if (e.key === 'ArrowUp' || e.key === 'ArrowDown') {
      e.preventDefault();
    }
  };

  const handleWheel = (e) => {
    e.target.blur();
  };
  useEffect(() => {
    if (fecha) {
      const parts = fecha.split('-');
      if (parts.length === 3) {
        const d = new Date(parts[0], parts[1] - 1, parts[2]);
        const dayOfWeek = d.getDay();
        // If Sunday (0), Wednesday (3), or Thursday (4), only 'comida' is available.
        // If the current shift is 'cena', reset it to '' since 'cena' is closed on these days.
        if ((dayOfWeek === 0 || dayOfWeek === 3 || dayOfWeek === 4) && turno === 'cena') {
          setTurno('');
        }
      }
    }
  }, [fecha, turno, setTurno]);

  const getAvailableShifts = () => {
    if (!fecha) return ['comida', 'cena'];
    const parts = fecha.split('-');
    if (parts.length !== 3) return ['comida', 'cena'];
    const d = new Date(parts[0], parts[1] - 1, parts[2]);
    const dayOfWeek = d.getDay();
    if (dayOfWeek === 0 || dayOfWeek === 3 || dayOfWeek === 4) {
      return ['comida'];
    }
    return ['comida', 'cena'];
  };

  const availableShifts = getAvailableShifts();

  const handleSiguiente = async () => {
    let finalComensales = parseInt(comensales, 10);
    if (isNaN(finalComensales) || finalComensales < 1) {
      finalComensales = 1;
      setComensales(1);
    } else if (finalComensales > 8) {
      finalComensales = 8;
      setComensales(8);
    }
    if (!fecha || !turno) return alert('Completa la data i el torn.');
    
    setIsLoading(true);
    try {
      let tables = [];
      try {
        // Consulta si hay mesas disponibles en el backend de Spring Boot
        tables = await getAvailableTables(finalComensales, turno);
        console.log('Mesas libres encontradas:', tables);
      } catch (error) {
        console.warn('Backend call failed, using mock tables for testing:', error);
      }
      
      // Fallback/Mock local si la base de datos o el backend devuelven vacío o fallan
      if (!tables || tables.length === 0) {
        tables = [
          { id: 1, tableID: 1, capacity: 4, state: "FREE", location: "Comedor" }
        ];
      }
      
      setMesasDisponibles(tables);
      setFase(2);
    } catch (error) {
      console.error(error);
      alert('S\'ha produït un error en consultar la disponibilitat. Si us plau, torna-ho a provar.');
    } finally {
      setIsLoading(false);
    }
  };

  return (
    <div id="fase-1">
      <div className="seccion alinear-centro">
        <label>Persones</label>
        <div className="control-cantidad">
          <button type="button" onClick={handleDecrement}>-</button>
          <input
            id="display-comensales"
            type="number"
            value={comensales}
            onChange={(e) => handleComensales(e.target.value)}
            onBlur={handleBlur}
            onKeyDown={handleKeyDown}
            onWheel={handleWheel}
            min="1"
            max="8"
          />
          <button type="button" onClick={handleIncrement}>+</button>
        </div>
        {mostrarAviso && (
          <p className="aviso-personas">
            Per a reserves de més de 8 persones, truqueu al 649596507
          </p>
        )}
      </div>
      <div className="seccion alinear-centro">
        <label>Data</label>
        <div className="grid-fechas">
          {fechasRapidas.map((f, i) => (
            <button
              key={i} type="button"
              className={`btn-fecha ${fecha === f.fechaISO && !mostrarCalendario ? 'seleccionado' : ''}`}
              onClick={() => { setFecha(f.fechaISO); setMostrarCalendario(false); flatpickrRef.current?.clear(); }}
            >
              <span>{f.diaTexto}</span><span>{f.diaNum}</span><span>{f.mesTexto}</span>
            </button>
          ))}
        </div>
        <div className="contenedor-fecha-mas">
          <button type="button" className="btn-fecha-mas" onClick={() => { setMostrarCalendario(true); flatpickrRef.current?.open(); }}>...</button>
        </div>
        <input type="text" ref={dateInputRef} className={`input-fecha-centrado ${mostrarCalendario ? '' : 'oculto'}`} placeholder="Seleccionar una altra data" />
      </div>
      <div className="seccion alinear-centro">
        <label>Torn</label>
        <div className="grid-turnos">
          {availableShifts.map((t) => (
            <button key={t} type="button" className={`btn-turno ${turno === t ? 'seleccionado' : ''}`} onClick={() => setTurno(t)}>
              {t === 'comida' ? 'Dinar' : 'Sopar'}
            </button>
          ))}
        </div>
      </div>
      <button type="button" onClick={handleSiguiente} disabled={isLoading}>
        {isLoading ? 'Carregant...' : 'Següent'}
      </button>
    </div>
  );
}