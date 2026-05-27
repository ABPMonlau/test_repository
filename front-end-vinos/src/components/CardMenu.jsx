import { useState } from "react";

export default function CardMenu({ menu }) {
  const [isOpen, setIsOpen] = useState(false);

  // SVG de adorno/floritura para los separadores clásicos
  const ScrollFlourish = () => (
    <div className="flex justify-center my-3 select-none pointer-events-none">
      <svg
        className="w-20 h-3 text-canal-border/40"
        viewBox="0 0 100 12"
        fill="none"
        stroke="currentColor"
        strokeWidth="1.2"
        strokeLinecap="round"
      >
        <path d="M10 6 C 30 14, 40 -2, 50 6 C 60 14, 70 -2, 90 6" />
        <circle cx="50" cy="6" r="2.5" className="fill-canal-border/40" />
      </svg>
    </div>
  );

  return (
    <div
      onClick={() => setIsOpen(!isOpen)}
      className={`double-border-frame w-full shadow-md hover:shadow-xl transition-all duration-500 ease-out cursor-pointer flex flex-col group select-none ${
        isOpen ? "!bg-canal-alt border-canal-border" : "!bg-canal-bg hover:!bg-canal-alt/50 border-canal-border/40"
      }`}
    >
      <div className="double-border-frame-inner p-6 sm:p-8 flex flex-col items-center justify-between grow transition-all duration-500">
        
        {/* Parte Superior: Cabecera del Menú */}
        <div className="w-full flex flex-col items-center text-center gap-3">
          {/* Monograma de Marca o Número */}
          <span className="font-serif-italic italic text-lg text-canal-secondary opacity-60">
            {menu.id === "dia" ? "I" : menu.id === "cap-de-setmana" ? "II" : "III"}
          </span>

          {/* Título Principal */}
          <h3 className="font-serif-romana text-xl sm:text-2xl uppercase tracking-[0.2em] text-canal-text  transition-all duration-500">
            {menu.title}
          </h3>

          {/* Subtítulo */}
          <p className="font-sans-humanist text-[11px] uppercase tracking-widest text-canal-secondary font-light max-w-[200px] leading-relaxed">
            {menu.subtitle}
          </p>

          <div className="w-12 h-px bg-canal-border/30 my-2"></div>
        </div>

        {/* Bloque de Precio y Detalles */}
        <div className="my-6 flex flex-col items-center gap-2">
          <div className="border border-canal-border/40 px-6 py-2.5 bg-canal-bg shadow-sm">
            <span className="font-sans-humanist text-lg sm:text-xl font-bold tracking-wider text-canal-text">
              {menu.price}
            </span>
          </div>
          <span className="font-sans-humanist text-[8px] sm:text-[9px] uppercase tracking-[0.15em] text-canal-secondary">
            {menu.id === "dia" ? "amb pa, aigua i vi" : "amb pa i aigua"}
          </span>
        </div>

        {/* Indicador de Acción */}
        <div className="flex items-center gap-1.5 font-sans-humanist text-[10px] uppercase tracking-[0.2em] font-bold text-canal-secondary group-hover:text-canal-text transition-colors duration-300">
          <span>{isOpen ? "Tancar menú" : "Veure el menú"}</span>
          <span className={`transform transition-transform duration-300 ${isOpen ? "rotate-180" : ""}`}>
            ↓
          </span>
        </div>

        {/* CONTENIDO DESPLEGABLE: Detalles del Menú */}
        <div
          className={`w-full overflow-hidden transition-all duration-700 ease-in-out ${
            isOpen ? "max-h-[1200px] opacity-100 mt-8 pt-6 border-t border-canal-border/20" : "max-h-0 opacity-0"
          }`}
        >
          {/* Cocktail de Bienvenida */}
          {menu.welcome && (
            <div className="mb-6 text-center">
              <span className="font-sans-humanist text-[9px] uppercase tracking-[0.25em] text-canal-secondary block mb-1">
                Benvinguda
              </span>
              <p className="font-serif-italic italic text-base text-canal-text">
                {menu.welcome}
              </p>
            </div>
          )}

          {/* Secciones del Menú */}
          <div className="flex flex-col gap-6">
            {menu.sections.map((section, sIdx) => (
              <div key={sIdx} className="flex flex-col items-center w-full">
                
                {/* Nombre de la Categoría */}
                <h4 className="font-sans-humanist text-[10px] sm:text-xs uppercase tracking-[0.2em] text-canal-secondary font-semibold border-b border-canal-border/20 pb-1.5 mb-4 w-full text-center">
                  {section.name}
                </h4>

                {/* Platos / Items */}
                <div className="flex flex-col gap-3 w-full text-center">
                  {section.items.map((item, iIdx) => {
                    if (item.isSeparator) {
                      return <ScrollFlourish key={iIdx} />;
                    }

                    return (
                      <div key={iIdx} className="flex flex-col items-center gap-0.5">
                        <div className="flex justify-center items-baseline gap-1.5 flex-wrap">
                          <p className="font-sans-humanist text-xs sm:text-sm text-canal-text font-medium tracking-wide">
                            {item.name}
                          </p>
                          {item.supplement && (
                            <span className="font-serif-italic italic text-xs text-canal-secondary">
                              ({item.supplement})
                            </span>
                          )}
                        </div>
                        {item.description && (
                          <p className="font-serif-italic italic text-xs text-canal-secondary max-w-[280px]">
                            {item.description}
                          </p>
                        )}
                        {item.extraNote && (
                          <p className="font-serif-italic italic text-[11px] text-canal-secondary/70 mt-1">
                            {item.extraNote}
                          </p>
                        )}
                      </div>
                    );
                  })}
                </div>

              </div>
            ))}
          </div>

          {/* Nota al pie del menú */}
          <div className="mt-8 pt-4 border-t border-canal-border/10 text-center flex flex-col gap-1">
            <span className="font-sans-humanist text-[8px] uppercase tracking-widest text-canal-secondary">
              IVA Inclòs
            </span>
            <span className="font-serif-italic italic text-xs text-canal-secondary">
              {menu.priceDetails.split(" • ")[1]}
            </span>
          </div>

        </div>

      </div>
    </div>
  );
}
