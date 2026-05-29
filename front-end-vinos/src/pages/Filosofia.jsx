import {useEffect, useState} from "react";
import {Link} from "react-router-dom";

// Importar imágenes de Figma descargadas en assets
import algo1 from "../assets/algo_1.png";
import image1 from "../assets/image_1.png";
import wow1 from "../assets/wow_1.png";

// Importar imágenes de platos existentes para el mostrador interactivo de la Sección 2
import dishImg from "../assets/gourmet_catalan_dish.png";
import fishImg from "../assets/grilled_fish.png";
import dessertImg from "../assets/crema_catalana.png";

export default function Filosofia() {
  // Asegurar scroll-to-top inmediato al cargar la página de Filosofía
  useEffect(() => {
    window.scrollTo({top: 0, behavior: "instant"});
  }, []);

  // Estado para el mostrador gastronómico interactivo de la Sección 2
  const [activePlato, setActivePlato] = useState(0);

  const PLATOS_SELECCIONADOS = [
    {
      title: "Mar i Graella",
      subtitle: "peix salvatge de llotja",
      img: fishImg,
      desc: "Llobarro a la graella amb verdures de la nostra pròpia horta. Cuinat lentament a la brasa per preservar la seva finor i autenticitat salvatge.",
    },
    {
      title: "Ibèric i Muntanya",
      subtitle: "carrillera de porc ibèric",
      img: dishImg,
      desc: "Carrillera de porc ibèric amb bolets de bosc i reducció aromàtica. Un homenatge als sabors rústics i la caça de la terra de Tona.",
    },
    {
      title: "Dolç i Tradició",
      subtitle: "crema catalana moderna",
      img: dessertImg,
      desc: "Una deconstrucció lleugera i cruixent de la crema tradicional, aromatitzada amb cítrics frescos i vainilla natural de Madagascar.",
    },
  ];

  const handleReservationClick = () => {
    alert("Redirigint al sistema de reserves de taules...");
  };

  return (
    <div className="min-h-screen bg-canal-bg text-canal-text overflow-hidden marble-subtle-bg selection:bg-canal-border/30">
      {/* ==========================================
          SECCIÓ 1: GALERIA EDITORIAL HERO (FIGMA)
          ========================================== */}
      <section className="relative w-full max-w-[1600px] mx-auto px-4 md:px-12 py-16 xl:py-24 flex flex-col items-center">
        {/* Capa de Fons: Tipografía Gigante en z-0 */}
        <div className="absolute top-[35%] xl:top-[38%] left-0 right-0 text-center pointer-events-none select-none z-0 hidden md:block opacity-[0.05]">
          <span className="font-serif-romana text-[12vw] font-bold uppercase tracking-[0.3em] leading-none text-canal-text">
            La Canal
          </span>
        </div>

        {/* Marco Perimetral Decorativo (Figma ID 1:52) */}
        <div className="absolute inset-x-8 xl:inset-x-20 top-[12%] bottom-[12%] border border-canal-border/20 rounded-[153px] pointer-events-none z-10 hidden xl:block"></div>

        {/* Título Principal Editorial Móvil (Visible solo en pantallas pequeñas) */}
        <div className="md:hidden text-center flex flex-col gap-2 mb-10">
          <span className="font-sans-humanist text-[11px] uppercase tracking-[0.25em] text-canal-secondary font-semibold">
            Restaurant La Canal
          </span>
          <h1 className="font-serif-romana text-4xl uppercase tracking-[0.15em] text-canal-text">
            Filosofia
          </h1>
          <div className="w-12 h-px bg-canal-border/60 mx-auto mt-2"></div>
        </div>

        {/* Grid de 3 Columnas Editoriales Asimétricas (Figma 1:61, 1:53, 1:57) */}
        <div className="w-full grid grid-cols-1 md:grid-cols-3 gap-8 xl:gap-12 z-20 relative max-w-[1400px]">
          {/* Targeta 1 (algo 1) */}
          <div className="group relative flex flex-col animate-soft-float">
            <div className="double-border-frame shadow-xl hover:shadow-2xl duration-700 aspect-[4/6] md:h-[650px] xl:h-[720px] overflow-hidden flex flex-col">
              <div className="double-border-frame-inner p-1.5 flex-grow overflow-hidden relative">
                <img
                  src={algo1}
                  alt="La Canal ambient i tradició"
                  className="w-full h-full object-cover grayscale-[20%] hover:grayscale-0 hover:scale-105 transition-all duration-700 ease-out"
                />
                {/* Overlay Premium en hover */}
                <div className="absolute inset-0 bg-gradient-to-t from-black/50 via-transparent to-transparent opacity-0 group-hover:opacity-100 transition-opacity duration-500 flex flex-col justify-end p-6">
                  <span className="font-sans-humanist text-white text-[10px] uppercase tracking-[0.2em] font-semibold">
                    Origen i Detall
                  </span>
                  <span className="font-serif-italic text-canal-bg italic text-sm mt-1">
                    l'essència del nostre entorn
                  </span>
                </div>
              </div>
            </div>
          </div>

          {/* Targeta 2 (image 1) */}
          <div className="group relative flex flex-col animate-soft-float-delayed md:translate-y-8">
            <div className="double-border-frame shadow-xl hover:shadow-2xl duration-700 aspect-[4/6] md:h-[650px] xl:h-[720px] overflow-hidden flex flex-col">
              <div className="double-border-frame-inner p-1.5 flex-grow overflow-hidden relative">
                <img
                  src={image1}
                  alt="La Canal producte i temporalitat"
                  className="w-full h-full object-cover grayscale-[20%] hover:grayscale-0 hover:scale-105 transition-all duration-700 ease-out"
                />
                <div className="absolute inset-0 bg-gradient-to-t from-black/50 via-transparent to-transparent opacity-0 group-hover:opacity-100 transition-opacity duration-500 flex flex-col justify-end p-6">
                  <span className="font-sans-humanist text-white text-[10px] uppercase tracking-[0.2em] font-semibold">
                    Producte i Temporalitat
                  </span>
                  <span className="font-serif-italic text-canal-bg italic text-sm mt-1">
                    cuina honesta sense presses
                  </span>
                </div>
              </div>
            </div>
          </div>

          {/* Targeta 3 (wow 1) */}
          <div className="group relative flex flex-col animate-soft-float md:-translate-y-4">
            <div className="double-border-frame shadow-xl hover:shadow-2xl duration-700 aspect-[4/6] md:h-[650px] xl:h-[720px] overflow-hidden flex flex-col">
              <div className="double-border-frame-inner p-1.5 flex-grow overflow-hidden relative">
                <img
                  src={wow1}
                  alt="La Canal cuina honesta"
                  className="w-full h-full object-cover grayscale-[20%] hover:grayscale-0 hover:scale-105 transition-all duration-700 ease-out"
                />
                <div className="absolute inset-0 bg-gradient-to-t from-black/50 via-transparent to-transparent opacity-0 group-hover:opacity-100 transition-opacity duration-500 flex flex-col justify-end p-6">
                  <span className="font-sans-humanist text-white text-[10px] uppercase tracking-[0.2em] font-semibold">
                    Passió i Tècnica
                  </span>
                  <span className="font-serif-italic text-canal-bg italic text-sm mt-1">
                    el gust de la honestedat
                  </span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

      {/* ==========================================
          SECCIÓ 2: MANIFEST & CUINA HONESTA (FIGMA)
          ========================================== */}
      <section className="relative w-full max-w-[1600px] mx-auto px-4 md:px-12 py-16 xl:py-24 bg-canal-bg border-t border-canal-border/10 flex flex-col items-center">
        {/* Gran marca d'aigua de fons "La Canal" */}
        <div className="absolute top-[10%] left-0 right-0 text-center pointer-events-none select-none z-0 hidden lg:block opacity-[0.03]">
          <span className="font-serif-romana text-[12vw] font-bold uppercase tracking-[0.25em] leading-none text-canal-text">
            La Canal
          </span>
        </div>

        {/* Cercle Decoratiu de Gran Diàmetre (Figma ID 1:32) */}
        <div className="absolute right-[-10%] top-[5%] w-[870px] h-[630px] border border-canal-border/15 rounded-full pointer-events-none z-10 hidden xl:block"></div>

        {/* Contingut en Flexbox / Grid Asimètric */}
        <div className="w-full flex flex-col lg:flex-row gap-12 xl:gap-16 z-20 max-w-[1400px]">
          
          {/* Tarjeta 1: El Manifest Escrit (Figma ID 1:24) */}
          <div className="w-full lg:w-[35%] flex flex-col justify-center items-center lg:items-start">
            <div className="double-border-frame w-full max-w-md shadow-xl hover:shadow-2xl duration-700 bg-canal-bg">
              <div className="double-border-frame-inner p-8 sm:p-12 flex flex-col items-center text-center gap-6">
                
                {/* Títol en Serif Romana clàssica en majúscules */}
                <h2 className="font-serif-romana uppercase tracking-[0.16em] text-2xl sm:text-3xl lg:text-4xl leading-[1.3] font-semibold text-canal-text">
                  Cuina
                  <br />
                  Honesta
                  <br />i de Producte
                </h2>

                {/* Separador de la marca */}
                <div className="w-16 h-[1px] bg-canal-border/60 my-2"></div>

                {/* Paràgraf en tipografia limpia i lleugera */}
                <p className="font-sans-humanist text-[13px] sm:text-sm text-canal-secondary font-light leading-relaxed tracking-wider">
                  Sabor local genuí. Productes de proximitat i temporada
                  seleccionats directament de la terra. Una experiència gastronòmica
                  pausada dissenyada per despertar les teves emocions.
                </p>

                {/* Botó de Reserva clàssic adaptat a les directrius */}
                <button
                  onClick={handleReservationClick}
                  className="group relative mt-4 px-8 py-3.5 border border-canal-border hover:border-canal-text text-canal-text font-sans-humanist uppercase text-[10px] tracking-[0.2em] font-semibold bg-transparent hover:bg-canal-text hover:text-canal-bg duration-500 overflow-hidden active:scale-95 cursor-pointer shadow-sm hover:shadow-md"
                >
                  <span className="relative z-10">
                    Reservar Taula
                  </span>
                </button>
              </div>
            </div>
          </div>

          {/* Tarjeta 2: MOSTRADOR GASTRONÒMIC INTERACTIU (Figma ID 1:34 adaptat a la SKILL) */}
          <div className="w-full lg:w-[65%] flex flex-col justify-between">
            <div className="double-border-frame w-full h-full shadow-xl hover:shadow-2xl duration-700 bg-canal-bg">
              <div className="double-border-frame-inner p-2 sm:p-4 md:p-6 flex flex-col gap-6 h-full justify-between">
                
                {/* Capçalera del Mostrador Interactiu */}
                <div className="flex flex-col sm:flex-row items-center justify-between border-b border-canal-border/20 pb-4 px-4 gap-4">
                  <div className="flex flex-col items-center sm:items-start">
                    <span className="font-sans-humanist text-[9px] uppercase tracking-[0.25em] text-canal-secondary font-bold">
                      Mostrador Gastronòmic
                    </span>
                    <span className="font-serif-italic italic text-xs text-canal-secondary/70">
                      detall de creacions i temporalitat
                    </span>
                  </div>
                  
                  {/* Pestanyes de selecció elegant */}
                  <div className="flex gap-4">
                    {PLATOS_SELECCIONADOS.map((plato, idx) => (
                      <button
                        key={idx}
                        onClick={() => setActivePlato(idx)}
                        className={`font-sans-humanist text-[10px] uppercase tracking-[0.15em] font-semibold py-1 px-3 border transition-all duration-300 cursor-pointer ${
                          activePlato === idx
                            ? "border-canal-text bg-canal-text text-canal-bg"
                            : "border-canal-border/30 text-canal-secondary hover:border-canal-text hover:text-canal-text"
                        }`}
                      >
                        {idx + 1}
                      </button>
                    ))}
                  </div>
                </div>

                {/* Contingut Dinàmic de la Creació amb transicions netes */}
                <div className="flex flex-col md:flex-row gap-6 p-4 items-center md:items-start min-h-[350px]">
                  
                  {/* Foto del Plat Seleccionat */}
                  <div className="w-full md:w-1/2 aspect-square md:h-[300px] overflow-hidden border border-canal-border/20 p-1 bg-white">
                    <img
                      src={PLATOS_SELECCIONADOS[activePlato].img}
                      alt={PLATOS_SELECCIONADOS[activePlato].title}
                      className="w-full h-full object-cover transition-transform duration-1000 hover:scale-105"
                    />
                  </div>

                  {/* Informació del Plat */}
                  <div className="w-full md:w-1/2 flex flex-col gap-4 text-center md:text-left justify-center h-full pt-4 md:pt-8">
                    <div className="flex flex-col gap-1">
                      <span className="font-serif-italic italic text-sm text-canal-secondary">
                        {PLATOS_SELECCIONADOS[activePlato].subtitle}
                      </span>
                      <h3 className="font-serif-romana uppercase tracking-[0.15em] text-xl sm:text-2xl font-semibold text-canal-text">
                        {PLATOS_SELECCIONADOS[activePlato].title}
                      </h3>
                    </div>
                    
                    <p className="font-sans-humanist text-xs sm:text-sm text-canal-secondary/90 font-light leading-relaxed tracking-wider">
                      {PLATOS_SELECCIONADOS[activePlato].desc}
                    </p>

                    <div className="pt-2 flex justify-center md:justify-start">
                      <Link
                        to="/menus"
                        className="font-sans-humanist text-[10px] uppercase tracking-[0.2em] font-semibold text-canal-text hover:text-canal-secondary flex items-center gap-2 border-b border-canal-text/30 pb-0.5"
                      >
                        Veure els menús sencers ➔
                      </Link>
                    </div>
                  </div>
                </div>

                {/* Sub-peu de targeta per a enllaços addicionals */}
                <div className="hidden md:flex justify-between items-center border-t border-canal-border/10 pt-4 px-4 text-[9px] font-sans-humanist tracking-widest text-canal-secondary opacity-60">
                  <span>PRODUCTES 100% LOCALS</span>
                  <span>TEMPORALITAT I RESPECTE</span>
                </div>
              </div>
            </div>
          </div>
        </div>

        {/* Segell Clàssic de Coordenades a sota (Figma ID 1:33, 1:49) */}
        <div className="mt-16 flex flex-col gap-0.5 items-center select-none text-center">
          <span className="font-sans-humanist text-[10px] uppercase tracking-[0.25em] text-canal-text font-semibold">
            La Canal • Tona
          </span>
          <span className="font-serif-italic italic text-xs text-canal-secondary">
            cuina d'origen
          </span>
        </div>
      </section>
    </div>
  );
}
