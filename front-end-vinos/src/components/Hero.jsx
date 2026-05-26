import dishImg from "../assets/gourmet_catalan_dish.png";
import fishImg from "../assets/grilled_fish.png";
import dessertImg from "../assets/crema_catalana.png";

export default function Hero() {
  const handleReservationClick = () => {
    alert("Redirigint al sistema de reserves de taules...");
  };

  return (
    <section className="w-full max-w-[1400px] mx-auto px-4 sm:px-6 md:px-8 lg:px-12 py-8 md:py-10 lg:py-12 flex flex-col xl:flex-row items-center gap-8 lg:gap-10 xl:gap-12">
      {/* Columna Izquierda: Tarjeta del Manifiesto Simplificada y Reducida */}
      <div className="w-full xl:w-[35%] flex justify-center xl:justify-start">
        {/* Cuadro de texto más reducido y compacto */}
        <div className="w-full max-w-md border border-canal-border/50 p-1.5 bg-canal-bg transition-all duration-700 hover:shadow-lg hover:border-canal-border animate-fade-in">
          <div className="border border-canal-border/50 p-6 sm:p-8 xl:py-12 xl:px-10 flex flex-col items-center text-center gap-5 sm:gap-6">
            {/* Título Serif Romana */}
            <h1 className="font-serif-romana uppercase tracking-[0.14em] text-2xl sm:text-3xl xl:text-4xl leading-[1.25] font-medium text-canal-text">
              Cuina Honesta i de Producte
            </h1>

            {/* Separador Fino */}
            <div className="w-12 h-px bg-canal-border/70"></div>

            {/* Texto Corto y Directo (Ideas Principales) */}
            <p className="font-sans-humanist text-xs sm:text-sm text-canal-secondary font-light max-w-xs leading-relaxed tracking-wider">
              Sabor local genuí. Productes frescos de temporada. Una experiència
              culinària pausada per despertar les teves emocions.
            </p>

            {/* Botón de Reserva */}
            <button
              onClick={handleReservationClick}
              className="mt-2 px-8 py-3 border border-canal-text/80 text-canal-text font-sans-humanist uppercase text-[12px] tracking-[0.2em] font-semibold bg-transparent hover:bg-canal-text hover:text-canal-bg hover:border-canal-text active:scale-95 transition-all duration-500 ease-out cursor-pointer shadow-sm hover:shadow"
            >
              Reservar Taula
            </button>
          </div>
        </div>
      </div>

      {/* Columna Derecha: Mosaico de 3 Imágenes Impresionantes */}
      <div className="w-full xl:w-[65%]">
        <div className="grid grid-cols-12 gap-4 sm:gap-3 w-full">
          {/* Imagen Principal 1 (Grande, 7 Columnas): Carrillera de Cerdo */}
          <div className="col-span-7 relative overflow-hidden rounded-xl border border-canal-border/20 bg-canal-alt shadow-sm group aspect-[3/4] sm:aspect-[4/5] md:aspect-[3/4] lg:aspect-[4/5] xl:aspect-[3/4] my-auto">
            <img
              src={dishImg}
              alt="Carrillera de porc ibèric a la brasa"
              fetchpriority="high" // Alta prioridad de carga para la imagen LCP principal
              className="w-full h-full object-cover transition-transform duration-1000 ease-out hover:scale-105"
            />
            {/* Distintivo Flotante */}
            <div className="absolute bottom-4 left-4 bg-black/45 backdrop-blur-sm border border-white/20 px-3 py-1.5 rounded-sm pointer-events-none">
              <span className="font-serif-italic italic text-[10px] sm:text-xs text-white tracking-widest lowercase">
                ibèric i bolets
              </span>
            </div>
          </div>

          {/* Columna con las 2 Imágenes Secundarias Apiladas (5 Columnas) */}
          <div className="col-span-5 flex flex-col justify-between gap-4 sm:gap-6">
            {/* Imagen Secundaria 2 (Pescado) */}
            <div className="flex-1 relative overflow-hidden rounded-xl border border-canal-border/20 bg-canal-alt shadow-sm group min-h-[130px] sm:min-h-[170px] aspect-[4/3] sm:aspect-square md:aspect-[4/3] lg:aspect-square xl:aspect-[4/3]">
              <img
                src={fishImg}
                alt="Llobarro a la graella amb verdures"
                fetchpriority="low" // Baja prioridad para imágenes secundarias
                className="w-full h-full object-cover transition-transform duration-1000 ease-out hover:scale-105"
              />
              <div className="absolute bottom-4 left-4 bg-black/45 backdrop-blur-sm border border-white/20 px-3 py-1.5 rounded-sm pointer-events-none">
                <span className="font-serif-italic italic text-[10px] sm:text-xs text-white tracking-widest lowercase">
                  mar i graella
                </span>
              </div>
            </div>

            {/* Imagen Secundaria 3 (Postre Crema Catalana) */}
            <div className="flex-1 relative overflow-hidden rounded-xl border border-canal-border/20 bg-canal-alt shadow-sm group min-h-[130px] sm:min-h-[170px] aspect-[4/3] sm:aspect-square md:aspect-[4/3] lg:aspect-square xl:aspect-[4/3]">
              <img
                src={dessertImg}
                alt="Crema catalana moderna"
                fetchpriority="low" // Baja prioridad para imágenes secundarias
                className="w-full h-full object-cover transition-transform duration-1000 ease-out hover:scale-105"
              />
              <div className="absolute bottom-4 left-4 bg-black/45 backdrop-blur-sm border border-white/20 px-3 py-1.5 rounded-sm pointer-events-none">
                <span className="font-serif-italic italic text-[10px] sm:text-xs text-white tracking-widest lowercase">
                  crema catalana
                </span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}
