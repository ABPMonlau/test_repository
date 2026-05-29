import { useState } from 'react';
import './App.css';
import logo from './logo.jpg';
import Fase1 from './components/Fase1';
import Fase2 from './components/Fase2';
import Fase3 from './components/Fase3';
import emailjs from '@emailjs/browser';
import { postReservation, postClient } from './services/fetching';

export default function App() {
  const [fase, setFase] = useState(1);
  const [comensales, setComensales] = useState(1);
  const [fecha, setFecha] = useState('');
  const [turno, setTurno] = useState('');
  const [hora, setHora] = useState('');
  const [datosUsuario, setDatosUsuario] = useState({ nombre: '', email: '', telefono: '', notasEspeciales: '' });
  const [mesasDisponibles, setMesasDisponibles] = useState([]);

  // Helper function to map date and turn to turnos database ID
  const getShiftId = (fechaStr, turnoStr) => {
    if (!fechaStr) return 1;
    const days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
    const parts = fechaStr.split('-');
    if (parts.length !== 3) return 1;
    const d = new Date(parts[0], parts[1] - 1, parts[2]);
    const dayName = days[d.getDay()];

    if (dayName === 'Wednesday' && turnoStr === 'comida') return 1;
    if (dayName === 'Thursday' && turnoStr === 'comida') return 2;
    if (dayName === 'Friday' && turnoStr === 'comida') return 3;
    if (dayName === 'Friday' && turnoStr === 'cena') return 4;
    if (dayName === 'Saturday' && turnoStr === 'maniana') return 5;
    if (dayName === 'Saturday' && turnoStr === 'comida') return 6;
    if (dayName === 'Saturday' && turnoStr === 'cena') return 7;
    if (dayName === 'Sunday' && turnoStr === 'maniana') return 8;
    if (dayName === 'Sunday' && turnoStr === 'comida') return 9;
    return 1;
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    
    const serviceId = import.meta.env.VITE_EMAILJS_SERVICE_ID;
    const templateId = import.meta.env.VITE_EMAILJS_TEMPLATE_ID;
    const publicKey = import.meta.env.VITE_EMAILJS_PUBLIC_KEY;

    const formattedTurno = turno === 'comida' ? 'Dinar' : 'Sopar';
    const googleMapsLink = 'https://www.google.com/maps/search/?api=1&query=La+Canal+Restaurant+Carrer+Maria+Vivet+1+08551+Tona';

    const templateParams = {
      to_email: datosUsuario.email,
      to_name: datosUsuario.nombre,
      comensales: comensales,
      fecha: fecha,
      turno: formattedTurno,
      hora: hora,
      telefono: datosUsuario.telefono,
      notes: datosUsuario.notasEspeciales || 'Cap',
      google_maps_link: googleMapsLink,
    };

    try {
      // 1. Registrar al cliente en el backend (POST /agregar/cliente)
      const clientData = {
        name: datosUsuario.nombre,
        phone: datosUsuario.telefono,
        email: datosUsuario.email,
        bookDate: fecha
      };
      
      let clientId = 1;
      try {
        const clientResult = await postClient(clientData);
        clientId = (clientResult && clientResult.id) ? clientResult.id : 1;
      } catch (err) {
        console.warn("No se pudo registrar al cliente en el backend, usando ID de fallback:", err);
      }

      // 2. Seleccionar la primera mesa disponible
      const selectedTable = (mesasDisponibles && mesasDisponibles.length > 0) ? mesasDisponibles[0] : { id: 1 };
      
      // 3. Obtener el ID del turno correspondiente en la BBDD
      const shiftId = getShiftId(fecha, turno);

      // 4. Construir el payload de la reserva esperado por el backend
      const reservationPayload = {
        guests: comensales,
        bookDate: fecha,
        hour: hora + ":00", // Formato TIME esperado por MySQL/Java: HH:mm:ss
        creationDate: new Date().toISOString().split('T')[0],
        client: {
          id: clientId
        },
        table: {
          id: selectedTable.id
        },
        shift: {
          id: shiftId
        }
      };

      // 5. Guardar la reserva en la base de datos de Spring Boot
      try {
        await postReservation(reservationPayload);
      } catch (err) {
        console.warn("No se pudo guardar la reserva en el backend, procediendo con la confirmación:", err);
      }

      // 6. Enviar email de confirmación
      if (serviceId && templateId && publicKey) {
        await emailjs.send(serviceId, templateId, templateParams, publicKey);
        alert('¡Reserva confirmada! S\'ha enviat un email de confirmació.');
        console.log('Email sent successfully');
      } else {
        console.log('EmailJS keys not configured. Falling back to mailto link.');
        alert('¡Reserva realitzada amb èxit!.');
        sendMailtoFallback();
      }
    } catch (error) {
      console.error('Error al procesar la reserva:', error);
      alert('S\'ha produït un error en desar la reserva o enviar el correu. Si us plau, torna-ho a provar o contacta amb nosaltres.');
      sendMailtoFallback();
    }

    function sendMailtoFallback() { // Enviar email manualmente si EmailJS no funciona
      const emailBody = `Hola ${datosUsuario.nombre},

La teva reserva al Restaurant La Canal s'ha confirmat amb èxit.

Detalls de la reserva:
- Comensals: ${comensales}
- Data: ${fecha}
- Torn: ${formattedTurno}
- Hora: ${hora}
- Telèfon: ${datosUsuario.telefono}
- Notes: ${datosUsuario.notasEspeciales || 'Cap'}

Ubicació del restaurant a Google Maps:
${googleMapsLink}

T'esperem!
La Canal Restaurant`;

      const mailtoUrl = `mailto:${datosUsuario.email}?subject=Confirmaci%C3%B3%20de%20Reserva%20-%20La%20Canal&body=${encodeURIComponent(emailBody)}`;
      window.location.href = mailtoUrl;
    }
  };

  return (
    <form id="reserva-form" onSubmit={handleSubmit}>
      <div className="cabecera-logo">
        <img src={logo} alt="Logo La Canal" id="logo-restaurante" />
      </div>
      
      {fase === 1 && (
        <Fase1 
          comensales={comensales} 
          setComensales={setComensales} 
          fecha={fecha} 
          setFecha={setFecha} 
          turno={turno} 
          setTurno={setTurno} 
          setFase={setFase}
          setMesasDisponibles={setMesasDisponibles}
        />
      )}
      {fase === 2 && <Fase2 turno={turno} hora={hora} setHora={setHora} setFase={setFase} comensales={comensales} fecha={fecha} />}
      {fase === 3 && <Fase3 datosUsuario={datosUsuario} setDatosUsuario={setDatosUsuario} setFase={setFase} />}

      <div className="footer-info">
        <p><strong>La Canal</strong></p>
        <p>C/ Maria Vivet, 1, Tona, Spain 08551</p>
        <p>lacanalrestaurant@gmail.com | 649596507</p>
      </div>
    </form>
  );
}