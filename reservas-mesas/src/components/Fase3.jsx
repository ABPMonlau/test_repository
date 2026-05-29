export default function Fase3({ datosUsuario, setDatosUsuario, setFase }) {
  const handleInputChange = (e) => {
    const { name, value } = e.target;
    setDatosUsuario(prev => ({ ...prev, [name]: value }));
  };

  return (
    <div id="fase-3">
      <div className="seccion">
        <label htmlFor="nombre">Nom reserva:</label>
        <input type="text" id="nombre" name="nombre" value={datosUsuario.nombre} onChange={handleInputChange} required />
      </div>
      <div className="seccion">
        <label htmlFor="email">Correu electrònic:</label>
        <input type="email" id="email" name="email" value={datosUsuario.email} onChange={handleInputChange} required />
      </div>
      <div className="seccion">
        <label htmlFor="telefono">Telèfon:</label>
        <input type="tel" id="telefono" name="telefono" pattern="[6789][0-9]{8}" maxLength="9" placeholder="Ex: 612345678" value={datosUsuario.telefono} onChange={handleInputChange} required />
      </div>
      <div className="seccion">
        <label htmlFor="notasEspeciales">Notes (opcional):</label>
        <input type="text" id="notasEspeciales" name="notasEspeciales" placeholder="Al·lèrgies, ocasió especial…" value={datosUsuario.notasEspeciales} onChange={handleInputChange} />
      </div>
      <div className="botones-grupo">
        <button type="button" className="btn-secundario" onClick={() => setFase(2)}>Tornar</button>
        <button type="submit">Confirmar Reserva</button>
      </div>
    </div>
  );
}