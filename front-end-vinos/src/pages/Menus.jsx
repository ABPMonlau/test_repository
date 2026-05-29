import {useEffect} from "react";
import {Link} from "react-router-dom";
import CardMenu from "../components/CardMenu";

// Datos de los 3 menús del restaurante transcritos de forma impecable de las fichas originales
const MENUS_DATA = [
  {
    id: "dia",
    title: "Menú del Dia",
    subtitle: "De dimarts a divendres al migdia",
    price: "19,50€",
    priceDetails: "IVA inclòs • amb pa, aigua i copa de vi",
    sections: [
      {
        name: "Primers",
        items: [
          {name: "Amanida Waldorf"},
          {name: "Salmorejo"},
          {name: "Pasta amb gambes a l'all"},
          {name: "Zamburinyes amb salsa d'estragó", supplement: "supl. 8€"},
        ],
      },
      {
        name: "Segons",
        items: [
          {name: "Arròs de sípia"},
          {name: "Peix del dia amb salsa Nantua"},
          {name: "Llom de porc amb anisats i salsa tàrtara"},
          {name: "Filet de vedella", supplement: "supl. 14€"},
        ],
      },
      {
        name: "Postres",
        items: [
          {name: "Maduixes amb infusió de temporada"},
          {name: "Cremós de iogurt amb concasse de fruita"},
          {name: "Lemon pie deconstruït"},
        ],
      },
    ],
  },
  {
    id: "cap-de-setmana",
    title: "Menú Cap de Setmana",
    subtitle: "Dissabtes, diumenges i festius al migdia",
    welcome: "Cocktail benvinguda",
    price: "35€",
    priceDetails: "IVA inclòs • amb pa i aigua",
    sections: [
      {
        name: "Snacks",
        items: [
          {name: "Bunyol de formatge", description: "mel i llimona fermentada"},
          {name: "Xurro amb espuma de pesto i horseradish"},
          {
            name: "Snack de paté de pollastre",
            description: "amb quicos i blat de moro",
          },
          {
            name: "Crema d'anguila fumada",
            description:
              "gamba blanca amb oli dels seus caps, gel de cirera i consomé, xiitake i kombu",
          },
          {
            name: "Foie micuit",
            description:
              "amb coulis d'aglà, praliné d'avellanes i torradetes de brioix",
            supplement: "supl. 10€",
          },
        ],
      },
      {
        name: "Segons a escollir",
        items: [
          {name: "Peix del dia amb Gazpachuelo"},
          {
            name: "Terrina de caça i porc",
            description: "amb textures de remolatxa",
          },
        ],
      },
      {
        name: "Postres a escollir",
        items: [
          {name: "Textures de maduixa, vainilla i estragó"},
          {name: "Xocolata i ametlla"},
        ],
      },
    ],
  },
  {
    id: "interludi",
    title: "Menú Interludi",
    subtitle: "El nostre menú gastronòmic de cap de setmana",
    welcome: "Cocktail benvinguda",
    price: "45€",
    priceDetails: "IVA inclòs • amb pa i aigua",
    sections: [
      {
        name: "Snacks",
        items: [
          {
            name: "Bunyol de formatge",
            description: "mel i mandarina fermentada",
          },
          {name: "Xurro amb espuma de pesto i horseradish"},
          {
            name: "Snack de paté de pollastre",
            description: "amb quicos i blat de moro",
          },
          {
            name: "Crema d'anguila fumada",
            description:
              "gamba blanca amb oli dels seus caps, gel de cirera i consomé, xiitake i kombu",
          },
          {name: "Plat de verdures de temporada"},
          {
            name: "Foie micuit",
            description:
              "amb coulis d'aglà, praliné d'avellanes i torradetes de brioix",
            supplement: "supl. 10€",
          },
        ],
      },
      {
        name: "Segons a escollir",
        items: [
          {name: "Peix del dia amb Gazpachuelo"},
          {
            name: "Terrina de caça i porc",
            description: "amb textures de remolatxa",
          },
        ],
      },
      {
        name: "Postres a escollir",
        items: [
          {name: "Textures de maduixa, vainilla i estragó"},
          {
            name: "Xocolata i ametlla",
            extraNote: "Inclou els nostres petit fours",
          },
        ],
      },
    ],
  },
];

export default function Menus() {
  useEffect(() => {
    window.scrollTo({top: 0, behavior: "instant"});
  }, []);

  return (
    <div className="min-h-screen bg-canal-bg flex flex-col">
      {/* --- HERO EDITORIAL DE LOS MENÚS --- */}
      <section className="relative w-full max-w-[1400px] mx-auto px-6 md:px-12 pt-9 pb-12 overflow-hidden marble-subtle-bg flex flex-col items-center justify-center text-center gap-2">
        {/* Marca de fondo 3D gigante atenuada */}
        <div className="absolute top-[15%] pointer-events-none select-none z-0 opacity-[0.03] hidden md:block">
          <span className="font-serif-romana text-[8vw] font-bold uppercase tracking-[0.4em] leading-none text-canal-text">
            Els Menús
          </span>
        </div>

        {/* Enlace de retorno elegante */}
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
            <span className="font-sans-humanist text-[9px] uppercase tracking-[0.3em] text-canal-secondary font-bold">
              La Canal • Tona
            </span>
            <h1 className="font-serif-romana text-3xl md:text-4xl uppercase tracking-[0.2em] text-canal-text font-bold leading-tight">
              Els Menús
            </h1>
            <div className="w-16 h-px bg-canal-border/60 my-2"></div>
            <p className="font-serif-italic italic text-base md:text-lg text-canal-secondary leading-relaxed max-w-lg">
              "Cuina honesta, de gust, producte i temporalitat... una cuina
              sense presses."
            </p>
          </div>
        </div>
      </section>

      {/* --- SECCIÓN DE CARTAS DE MENÚ --- */}
      <main className="grow w-full max-w-300 mx-auto px-6 pb-12 z-10 relative">
        {/* Leyenda de uso para el usuario */}
        <div className="w-full flex justify-center mb-8">
          <span className="font-serif-italic italic text-xs text-canal-secondary opacity-80 animate-pulse text-center">
            * Clica sobre qualsevol dels menús per desplegar els seus plats /
            Haz clic para desplegar cada menú
          </span>
        </div>

        {/* Reusable Grid - Desktop: 3 columnas / Mobile: Vertical */}
        <div className="grid grid-cols-1 lg:grid-cols-3 gap-8 items-start">
          {MENUS_DATA.map((menu) => (
            <CardMenu key={menu.id} menu={menu} />
          ))}
        </div>
      </main>
    </div>
  );
}
