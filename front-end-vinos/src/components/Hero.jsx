import dishImg from "../assets/gourmet_catalan_dish.png";
import fishImg from "../assets/grilled_fish.png";
import dessertImg from "../assets/crema_catalana.png";
import HeroImageCard from "./HeroImageCard";

export default function Hero() {
  const handleReservationClick = () => {
    alert("Redirigint al sistema de reserves de taules...");
  };

  return (
    <section className="relative w-full max-w-400 mx-auto px-4 sm:px-6 md:px-8 lg:px-12 py-6 md:py-20 lg:py-20 overflow-hidden marble-subtle-bg flex flex-col xl:flex-row items-center gap-12 xl:gap-16">
      {/* --- Capa de Fondo 3D: Tipografía Gigante Editorial --- */}
      <div className="absolute top-[8%] left-[2%] right-[2%] text-center pointer-events-none select-none z-0 hidden md:block opacity-[0.04]">
        <span className="font-serif-romana text-[9vw] xl:text-[11vw] font-bold uppercase tracking-[0.35em] leading-none text-canal-text">
          La Canal
        </span>
      </div>

      {/* --- Columna Izquierda: Tarjeta del Manifiesto Asimétrica con Doble Borde --- */}
      <div className="w-full xl:w-[35%] flex justify-center xl:justify-start z-10 relative bottom-8 xl:left-16 mb-[-4.5%] mt-16 xl:mt-0 xl:mb-0">
        <div className="double-border-frame w-full max-w-md shadow-2xl hover:shadow-3xl hover:-translate-y-1 hover:border-canal-border/80 duration-700">
          <div className="double-border-frame-inner p-8 sm:p-10 md:p-12 flex flex-col items-center text-center gap-6">
            {/* Título en mayúsculas Serif Romana */}
            <h1 className="font-serif-romana uppercase tracking-[0.16em] text-3xl sm:text-4xl leading-[1.25] font-semibold text-canal-text">
              Cuina
              <br />
              Honesta
              <br />i de Producte
            </h1>

            {/* Separador fino característico */}
            <div className="w-16 h-px bg-canal-border/60 my-2"></div>

            {/* Texto descriptivo en tipografía limpia */}
            <p className="font-sans-humanist text-[13px] sm:text-sm text-canal-secondary font-light leading-relaxed tracking-wider">
              Sabor local genuí. Productes de proximitat i temporada
              seleccionats directament de la terra. Una experiència gastronòmica
              pausada dissenyada per despertar les teves emocions.
            </p>

            {/* Botón de Reserva con efecto de relleno dinámico */}
            <button
              onClick={handleReservationClick}
              className="group relative mt-4 px-8 py-3.5 border border-canal-text/80 text-canal-text font-sans-humanist uppercase text-[11px] tracking-[0.22em] font-bold bg-transparent hover:text-canal-bg duration-500 overflow-hidden active:scale-95 transition-all cursor-pointer shadow-md hover:shadow-xl hover:bg-black"
            >
              <span className="relative z-10 transition-colors duration-500 group-hover:text-canal-bg">
                Reservar Taula
              </span>
            </button>
          </div>
        </div>
      </div>

      {/* --- Columna Derecha: Mosaico Asimétrico Editorial Solapado --- */}
      <div className="w-full xl:w-[65%] flex justify-center items-center z-10">
        {/* --- MAQUETA DESKTOP (xl): Colaje Asimétrico Solapado en 3D --- */}
        <div className="hidden xl:flex relative w-full h-[700px] items-center justify-center">
          {/* Fondo geométrico circular clásico de decoración */}
          <div className="absolute inset-8 border border-canal-border/15 pointer-events-none rounded-full"></div>

          {/* --- Imagen 1: Carrillera de Cerdo (Principal, Centro-Izquierda) --- */}
          <HeroImageCard
            src={dishImg}
            alt="Carrillera de porc ibèric amb bolets"
            label="ibèric i bolets"
            className="absolute left-[15%] top-[-4%] w-[80%] aspect-[4/6] z-10 animate-soft-float hover:scale-105 hover:z-30"
            fetchPriority="high"
          />

          {/* --- Imagen 2: Llobarro a la graella (Secundaria, Arriba-Derecha, Superpuesta) --- */}
          <HeroImageCard
            src={fishImg}
            alt="Llobarro a la graella amb verdures"
            label="mar i graella"
            className="absolute left-[20%] top-[-24.5%] w-[56%] aspect-square z-20 hover:scale-105 hover:z-30"
            fetchPriority="low"
          />

          {/* --- Imagen 3: Crema Catalana (Secundaria, Abajo-Derecha, Superpuesta y Flotante) --- */}
          <HeroImageCard
            src={dessertImg}
            alt="Crema catalana moderna"
            label="crema catalana"
            className="absolute right-[9.3%] top-[16%] w-[56%] aspect-[1] z-25 animate-soft-float-delayed hover:scale-105 hover:z-30"
            fetchPriority="low"
          />

          {/* Sello clásico de coordenadas */}
          <div className="absolute left-[8%] bottom-[8%] pointer-events-none flex flex-col gap-0.5 items-start text-left opacity-30 select-none">
            <span className="font-sans-humanist text-[9px] uppercase tracking-[0.25em] text-canal-text font-semibold">
              La Canal • Tona
            </span>
            <span className="font-serif-italic italic text-[11px] text-canal-secondary">
              cuina d'origen
            </span>
          </div>
        </div>

        {/* --- MAQUETA MÓVIL/TABLET (< xl): Cuadrícula Editorial Estructurada --- */}
        <div className="flex xl:hidden w-full flex-col gap-6 mt-8 sm:mt-12 max-w-2xl">
          {/* Imagen Principal (Carrillera) - Grande y Destacada */}
          <HeroImageCard
            src={dishImg}
            alt="Carrillera de porc ibèric amb bolets"
            label="ibèric i bolets"
            className="w-full aspect-[4/3] sm:aspect-[16/9] animate-soft-float hover:scale-[1.02]"
            fetchPriority="high"
          />

          {/* Fila de Imágenes Secundarias (Llobarro y Crema Catalana) en Masonry */}
          <div className="grid grid-cols-2 gap-4 pb-6">
            <HeroImageCard
              src={fishImg}
              alt="Llobarro a la graella amb verdures"
              label="mar i graella"
              className="w-full aspect-square hover:scale-[1.02]"
              fetchPriority="low"
            />
            <HeroImageCard
              src={dessertImg}
              alt="Crema catalana moderna"
              label="crema catalana"
              className="w-full aspect-square animate-soft-float-delayed hover:scale-[1.02]"
              fetchPriority="low"
            />
          </div>
        </div>
      </div>
    </section>
  );
}
