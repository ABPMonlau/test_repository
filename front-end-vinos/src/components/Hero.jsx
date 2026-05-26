import dishImg from '../assets/gourmet_catalan_dish.png'

export default function Hero() {
  const handleReservationClick = () => {
    // Simular acción de reserva
    alert("Redirigint al sistema de reserves de taules...");
  };

  return (
    <section className="grid grid-cols-1 lg:grid-cols-12 min-h-screen lg:min-h-[85vh] bg-canal-bg text-canal-text items-stretch overflow-hidden">
      {/* Columna Izquierda: Tarjeta del Manifiesto Culinario */}
      <div className="lg:col-span-6 flex flex-col justify-center p-6 sm:p-12 lg:p-16 xl:p-20 bg-canal-bg relative z-10">
        
        {/* Doble Marco Perimetral Característico (Papelería La Canal) */}
        <div className="border border-canal-border/60 p-2 bg-canal-bg transition-all duration-1000 hover:shadow-xl hover:border-canal-border animate-fade-in">
          <div className="border border-canal-border/60 px-6 py-12 sm:px-10 sm:py-16 xl:py-20 xl:px-16 flex flex-col items-center text-center gap-6 sm:gap-8">
            
            {/* Texto de Entrada en Cursiva */}
            <span className="font-serif-italic italic text-canal-secondary text-base sm:text-lg lg:text-xl tracking-wide lowercase">
              — una cuina sense presses —
            </span>

            {/* Título Serif Romana en Mayúsculas */}
            <h1 className="font-serif-romana uppercase tracking-[0.16em] text-3xl sm:text-4xl xl:text-5xl leading-[1.2] font-normal text-canal-text max-w-xl">
              Cuina Honesta i de Producte
            </h1>

            {/* Separador Fino de Bronce Envejecido */}
            <div className="w-16 h-[1px] bg-canal-border/80"></div>

            {/* Descripción en Sans-Serif Humanista */}
            <p className="font-sans-humanist text-xs sm:text-sm xl:text-base text-canal-secondary font-light max-w-md leading-relaxed tracking-wider">
              Al cor de Tona, el Restaurant La Canal ofereix una proposta gastronòmica que respecta el temps, la temporalitat i l'origen de cada ingredient, despertant emocions en cada plat.
            </p>

            {/* Botón de Reserva Premium */}
            <button
              onClick={handleReservationClick}
              className="mt-4 px-10 py-4 border border-canal-text/80 text-canal-text font-sans-humanist uppercase text-xs tracking-[0.2em] font-medium bg-transparent hover:bg-canal-text hover:text-canal-bg hover:border-canal-text active:scale-95 transition-all duration-500 ease-out cursor-pointer shadow-sm hover:shadow-md"
            >
              Reservar Taula
            </button>
            
          </div>
        </div>

      </div>

      {/* Columna Derecha: Imagen Gastronómica Exquisita */}
      <div className="lg:col-span-6 relative overflow-hidden flex items-center justify-center bg-canal-alt min-h-[450px] lg:min-h-full">
        
        {/* Imagen con Alta Prioridad de Carga (LCP) */}
        <img
          src={dishImg}
          alt="Carrillera de porc ibèric amb bolets de temporada de La Canal"
          fetchpriority="high"
          className="w-full h-full object-cover transition-transform duration-1000 ease-out hover:scale-105"
        />

        {/* Capa de Sombra Decorativa */}
        <div className="absolute inset-0 bg-gradient-to-t from-black/40 via-transparent to-transparent pointer-events-none lg:bg-gradient-to-r lg:from-black/10"></div>

        {/* Distintivo Flotante Premium en Esquina de la Imagen */}
        <div className="absolute bottom-6 right-6 border border-white/30 p-1 backdrop-blur-md bg-black/40 text-white animate-fade-in shadow-lg rounded-sm pointer-events-none">
          <div className="border border-white/15 px-4 py-2 text-center">
            <span className="font-serif-italic italic text-xs sm:text-sm tracking-widest block">
              sabor, respecte i tradició
            </span>
          </div>
        </div>

      </div>
    </section>
  );
}