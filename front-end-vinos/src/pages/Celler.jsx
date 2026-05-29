import {useState, useEffect} from "react";
import {Link} from "react-router-dom";
import ListaVinos from "../components/ListaVinos";

// Conjunto de datos de respaldo (fallback inteligente) idénticos al de la base de datos MariaDB
// const FALLBACK_VINOS = [
//   {
//     vino_nombre: "Muga Crianza",
//     tipo_nombre: "Tinto",
//     bodega_nombre: "Bodegas Muga",
//     zona_origen: "D.O.Ca. Rioja",
//     anio: 2019,
//     Capacidad: "750 ml",
//     copa_nombre: "Copa Burdeos (Tinto)"
//   },
//   {
//     vino_nombre: "Terras Gauda O Rosal",
//     tipo_nombre: "Blanco",
//     bodega_nombre: "Terras Gauda",
//     zona_origen: "D.O. Rías Baixas",
//     anio: 2022,
//     Capacidad: "750 ml",
//     copa_nombre: "Copa Tulipa (Blanco)"
//   },
//   {
//     vino_nombre: "Coronas Crianza",
//     tipo_nombre: "Tinto",
//     bodega_nombre: "Familia Torres",
//     zona_origen: "D.O. Catalunya",
//     anio: 2019,
//     Capacidad: "750 ml",
//     copa_nombre: "Copa Burdeos (Tinto)"
//   }
// ];

export default function Celler() {
  const [vinos, setVinos] = useState([]);
  const [isLoading, setIsLoading] = useState(true);
  const [error, setError] = useState(null);

  // Asegurar que la pantalla comience al inicio (scroll top) en la carga
  useEffect(() => {
    window.scrollTo({top: 0, behavior: "instant"});
  }, []);

  // Consumir datos de la API de Flask con Fallback inteligente
  useEffect(() => {
    let active = true;

    async function fetchVinos() {
      try {
        setIsLoading(true);
        // Timeout de 3 segundos para la petición
        const controller = new AbortController();
        const timeoutId = setTimeout(() => controller.abort(), 3000);

        const response = await fetch("http://127.0.0.1:5000/vinos", {
          signal: controller.signal,
        });

        clearTimeout(timeoutId);

        if (!response.ok) {
          throw new Error(`HTTP error! status: ${response.status}`);
        }

        const data = await response.json();

        if (active) {
          // Si el servidor devuelve un array vacío o corrupto, recurrir a los datos de respaldo
          if (Array.isArray(data) && data.length > 0) {
            setVinos(data);
          } else {
            console.warn("La API retornó un conjunto de datos vacío.");
          }
          setIsLoading(false);
        }
      } catch (err) {
        if (active) {
          console.warn("No se pudo conectar con la API de vinos.", err.message);
          // Cargamos los datos estáticos de respaldo
          setIsLoading(false);
          // Omitimos setear el error visual para que la experiencia del usuario sea transparente y fluida
          setError(null);
        }
      }
    }

    fetchVinos();

    return () => {
      active = false;
    };
  }, []);

  return (
    <div className="min-h-screen bg-canal-bg flex flex-col">
      {/* --- HERO EDITORIAL DE LA BODEGA --- */}
      <section className="relative w-full max-w-[1400px] mx-auto px-6 md:px-12 pt-9 pb-12 overflow-hidden marble-subtle-bg flex flex-col items-center justify-center text-center gap-2">
        {/* Marca de fondo 3D gigante atenuada */}
        <div className="absolute top-[15%] pointer-events-none select-none z-0 opacity-[0.03] hidden md:block">
          <span className="font-serif-romana text-[8vw] font-bold uppercase tracking-[0.4em] leading-none text-canal-text">
            El Celler
          </span>
        </div>

        {/* Enlace elegante de retorno al inicio */}
        <div className="z-10 w-full flex justify-start mb-4">
          <Link
            to="/"
            className="group flex items-center gap-2 font-sans-humanist text-[10px] uppercase tracking-[0.2em] text-canal-secondary hover:text-canal-text font-bold duration-300"
          >
            <span className="transform transition-transform duration-300 group-hover:-translate-x-1">
              ←
            </span>
            Tornar a l'inici / Volver al inicio
          </Link>
        </div>

        {/* Bloque de Cabecera con Doble Borde */}
        <div className="double-border-frame w-full max-w-2xl z-10 shadow-lg mt-2">
          <div className="double-border-frame-inner px-8 py-10 md:px-20 md:py-14 flex flex-col items-center gap-4">
            {/* Sello de Ubicación */}
            <span className="font-sans-humanist text-[9px] uppercase tracking-[0.3em] text-canal-secondary font-bold">
              La Canal • Tona
            </span>

            {/* Título Principal */}
            <h1 className="font-serif-romana text-3xl md:text-4xl uppercase tracking-[0.2em] text-canal-text font-bold leading-tight">
              El Celler
            </h1>

            {/* Separador */}
            <div className="w-16 h-px bg-canal-border/60 my-2"></div>

            {/* Cita Editorial */}
            <p className="font-serif-italic italic text-base md:text-lg text-canal-secondary leading-relaxed max-w-lg">
              "Una selecció honesta i compromesa per acompanyar una cuina de
              gust, producte i temporalitat... una cuina sense presses."
            </p>
          </div>
        </div>
      </section>

      {/* --- SECCIÓN DE LA LISTA DE VINOS --- */}
      <main className="grow pb-24 z-10 relative">
        <ListaVinos vinos={vinos} isLoading={isLoading} error={error} />
      </main>
    </div>
  );
}
