import {useState, useMemo} from "react";
import CardVino from "./CardVino";

export default function ListaVinos({vinos, isLoading, error}) {
  const [searchQuery, setSearchQuery] = useState("");
  const [selectedType, setSelectedType] = useState("all");

  // 1. Filtrar los vinos en base al buscador y al filtro de tipos
  const filteredVinos = useMemo(() => {
    return vinos.filter((vino) => {
      const matchSearch =
        vino.vino_nombre.toLowerCase().includes(searchQuery.toLowerCase()) ||
        vino.bodega_nombre.toLowerCase().includes(searchQuery.toLowerCase()) ||
        vino.zona_origen.toLowerCase().includes(searchQuery.toLowerCase());

      const matchType =
        selectedType === "all" ||
        (vino.tipo_nombre &&
          vino.tipo_nombre.toLowerCase().trim() ===
            selectedType.toLowerCase().trim());

      return matchSearch && matchType;
    });
  }, [vinos, searchQuery, selectedType]);

  // 2. Extraer todos los tipos únicos presentes en los datos de vinos para los filtros rápidos
  const uniqueTypes = useMemo(() => {
    const types = new Set();
    vinos.forEach((v) => {
      if (v.tipo_nombre) {
        types.add(v.tipo_nombre.trim());
      }
    });
    return Array.from(types).sort();
  }, [vinos]);

  // 3. Agrupar los vinos filtrados por tipo de vino
  const groupedVinos = useMemo(() => {
    const groups = {};
    filteredVinos.forEach((vino) => {
      const type = vino.tipo_nombre || "Altres / Otros";
      if (!groups[type]) {
        groups[type] = [];
      }
      groups[type].push(vino);
    });

    // Ordenar los vinos alfabéticamente por su nombre dentro de cada grupo
    Object.keys(groups).forEach((key) => {
      groups[key].sort((a, b) => a.vino_nombre.localeCompare(b.vino_nombre));
    });

    return groups;
  }, [filteredVinos]);

  // Cabeceras de tipo formateadas en mayúsculas estéticas
  const formatTypeHeader = (type) => {
    // Si es catalán en la base de datos o español, devolvemos un título elegante
    const normalized = type.toLowerCase();
    if (normalized === "tinto") return "Vins Tints / Vinos Tintos";
    if (normalized === "blanco") return "Vins Blancs / Vinos Blancos";
    if (normalized === "espumoso") return "Vins Escumosos / Espumosos";
    if (normalized === "rosado" || normalized === "rosat")
      return "Vins Rosats / Rosados";
    return type.toUpperCase();
  };

  // --- RENDERIZADO DE SKELETON LOADER (ESTADO DE CARGA SOPHISTICATED) ---
  if (isLoading) {
    return (
      <div className="w-full flex flex-col gap-12 py-10">
        <div className="flex flex-col items-center gap-4 max-w-md mx-auto w-full px-4">
          <div className="h-10 bg-canal-border/15 animate-pulse w-full rounded border border-canal-border/10"></div>
          <div className="h-4 bg-canal-border/10 animate-pulse w-2/3 rounded"></div>
        </div>
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-10 md:gap-14 max-w-[1400px] mx-auto px-6 md:px-12 w-full">
          {[1, 2, 3].map((n) => (
            <div
              key={n}
              className="double-border-frame w-full max-w-sm mx-auto opacity-70"
            >
              <div className="double-border-frame-inner p-6 flex flex-col gap-6">
                <div className="w-full aspect-[3/4] bg-canal-border/10 animate-pulse border border-canal-border/5"></div>
                <div className="flex flex-col gap-3 items-center">
                  <div className="h-3 bg-canal-border/20 w-1/3 animate-pulse rounded"></div>
                  <div className="h-5 bg-canal-border/20 w-2/3 animate-pulse rounded"></div>
                  <div className="h-px bg-canal-border/10 w-12 my-1"></div>
                  <div className="h-4 bg-canal-border/10 w-1/2 animate-pulse rounded"></div>
                </div>
              </div>
            </div>
          ))}
        </div>
      </div>
    );
  }

  // --- RENDERIZADO DE ERROR ---
  if (error) {
    return (
      <div className="double-border-frame max-w-lg mx-auto my-12 text-center">
        <div className="double-border-frame-inner p-8 flex flex-col gap-4 items-center">
          <span className="font-serif-romana uppercase tracking-widest text-canal-secondary text-sm">
            Error de connexió
          </span>
          <p className="font-sans-humanist text-xs text-canal-secondary font-light leading-relaxed">
            No s'ha pogut establir la connexió con la bodega de datos. Per
            favor, verifica que el servei API estigui iniciat.
          </p>
        </div>
      </div>
    );
  }

  return (
    <div className="w-full flex flex-col gap-8 pt-12 pb-8">
      {/* --- PANEL DE BUSCADOR Y FILTROS RÁPIDOS --- */}
      <div className="max-w-[1400px] mx-auto w-full px-6 md:px-12 flex flex-col gap-8 justify-center items-center z-20">
        {/* Buscador de estilo editorial */}
        <div className="relative w-full md:max-w-md group">
          <input
            type="text"
            placeholder="Cerca vi, bodega o D.O...."
            value={searchQuery}
            onChange={(e) => setSearchQuery(e.target.value)}
            className="w-full bg-canal-bg border border-canal-border/40 hover:border-canal-border text-canal-text font-sans-humanist text-xs uppercase tracking-wider py-3.5 pl-5 pr-12 focus:outline-none focus:border-canal-text transition-all duration-300 placeholder:text-canal-secondary/50 placeholder:italic"
          />
          <div className="absolute right-4 top-1/2 -translate-y-1/2 pointer-events-none text-canal-secondary/60 group-focus-within:text-canal-text duration-300">
            <svg
              className="w-4 h-4"
              fill="none"
              viewBox="0 0 24 24"
              stroke="currentColor"
            >
              <path
                strokeLinecap="round"
                strokeLinejoin="round"
                strokeWidth={1.5}
                d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"
              />
            </svg>
          </div>
        </div>

        <div className="flex flex-wrap gap-3 md:gap-4 justify-center">
          <button
            onClick={() => setSelectedType("all")}
            className={`px-4 py-2 border text-[9px] font-sans-humanist uppercase tracking-[0.2em] font-semibold transition-all duration-300 cursor-pointer active:scale-95 ${
              selectedType === "all" ?
                "bg-canal-text text-canal-bg border-canal-text"
              : "border-canal-border/40 text-canal-secondary hover:border-canal-text hover:text-canal-text"
            }`}
          >
            Tots / Todos
          </button>

          {uniqueTypes.map((type) => (
            <button
              key={type}
              onClick={() => setSelectedType(type)}
              className={`px-4 py-2 border text-[9px] font-sans-humanist uppercase tracking-[0.2em] font-semibold transition-all duration-300 cursor-pointer active:scale-95 ${
                (
                  selectedType.toLowerCase().trim() ===
                  type.toLowerCase().trim()
                ) ?
                  "bg-canal-text text-canal-bg border-canal-text"
                : "border-canal-border/40 text-canal-secondary hover:border-canal-text hover:text-canal-text"
              }`}
            >
              {type}
            </button>
          ))}
        </div>
      </div>

      {/* Filtros de Tipo en All-Caps y espaciado */}

      {/* --- LISTADO AGRUPADO DE VINOS --- */}
      <div className="max-w-[1400px] mx-auto w-full px-6 md:px-12 flex flex-col gap-8 md:gap-16 mt-0">
        {Object.keys(groupedVinos).length > 0 ?
          Object.keys(groupedVinos).map((tipo) => (
            <section key={tipo} className="flex flex-col gap-8">
              {/* Encabezado elegante de la Categoría */}
              <div className="border-b border-canal-border/30 pb-6 flex justify-between items-end">
                <h2 className="font-serif-romana text-xl md:text-2xl uppercase tracking-[0.18em] text-canal-text font-semibold">
                  {formatTypeHeader(tipo)}
                </h2>
                <span className="font-serif-italic italic text-xs md:text-sm text-canal-secondary font-medium lowercase select-none">
                  {groupedVinos[tipo].length}{" "}
                  {groupedVinos[tipo].length === 1 ?
                    "vi disponible"
                  : "vins disponibles"}
                </span>
              </div>

              {/* Grid de las Tarjetas de Vinos */}
              <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-10 md:gap-12">
                {groupedVinos[tipo].map((vino, idx) => (
                  <CardVino key={`${vino.vino_nombre}-${idx}`} vino={vino} />
                ))}
              </div>
            </section>
          ))
        : /* Estado sin resultados */
          <div className="double-border-frame max-w-md mx-auto my-10 text-center">
            <div className="double-border-frame-inner p-10 flex flex-col gap-4 items-center">
              <span className="font-serif-romana uppercase tracking-widest text-canal-secondary text-xs">
                Sense resultats
              </span>
              <p className="font-sans-humanist text-[11px] text-canal-secondary/70 font-light leading-relaxed">
                No s'han trobat vins que coincideixin con los criteris de cerca
                seleccionats.
              </p>
              <button
                onClick={() => {
                  setSearchQuery("");
                  setSelectedType("all");
                }}
                className="mt-2 text-[9px] font-sans-humanist uppercase tracking-widest border-b border-canal-text text-canal-text hover:opacity-60 duration-300 font-semibold cursor-pointer pb-0.5"
              >
                Netejar filtres
              </button>
            </div>
          </div>
        }
      </div>
    </div>
  );
}
