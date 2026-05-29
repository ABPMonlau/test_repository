const franjas = {
  manana: ['08:00', '08:15', '08:30', '08:45', '09:00', '09:15', '09:30', '09:45', '10:00', '10:15', '10:30'],
  comida: ['13:30', '13:45', '14:00', '14:15', '14:30', '14:45', '15:00', '15:15', '15:30'],
  cena: ['20:00', '20:15', '20:30', '20:45', '21:00', '21:15', '21:30', '21:45', '22:00', '22:15', '22:30']
};

export default function Fase2({ turno, hora, setHora, setFase, comensales, fecha }) {
  const handleSiguiente = () => {
    if (!hora) return alert('Selecciona una franja horària.');
    setFase(3);
  };

  return (
    <div id="fase-2">
      <div className="seccion">
        <label>Hora:</label>
        <div className="grid-horas">
          {franjas[turno]?.map((h) => (
            <button key={h} type="button" className={`btn-hora ${hora === h ? 'seleccionado' : ''}`} onClick={() => setHora(h)}>
              {h}
            </button>
          ))}
        </div>
      </div>
      <div className="botones-grupo">
        <button type="button" className="btn-secundario" onClick={() => setFase(1)}>Tornar</button>
        <button type="button" onClick={handleSiguiente}>Següent</button>
      </div>
    </div>
  );
}