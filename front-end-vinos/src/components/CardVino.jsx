/**
 * @fileoverview Componente CardVino — Tarjeta individual de presentación de un vino.
 *
 * Recibe un objeto `vino` procedente del endpoint `GET /vinos` de la API Flask
 * y renderiza una tarjeta editorial con imagen dinámica según el tipo de vino,
 * ficha técnica (añada, formato, copa) y metadatos de bodega y origen.
 *
 * Las imágenes se resuelven de forma local mediante el mapa {@link WINE_IMAGES};
 * no se requiere ninguna petición adicional a la red para las miniaturas.
 */

// Mapeo de fotos editoriales premium de Unsplash para cada tipo de vino
const WINE_IMAGES = {
  tinto: "https://images.unsplash.com/photo-1584916201218-f4242ceb4809?auto=format&fit=crop&w=600&h=800&q=80",
  blanco: "https://images.unsplash.com/photo-1568213816046-0ee1c42bd559?auto=format&fit=crop&w=600&h=800&q=80",
  espumoso: "https://images.unsplash.com/photo-1594498653385-d5172b535748?auto=format&fit=crop&w=600&h=800&q=80",
  rosado: "https://images.unsplash.com/photo-1553184920-520541230939?auto=format&fit=crop&w=600&h=800&q=80",
  rosat: "https://images.unsplash.com/photo-1553184920-520541230939?auto=format&fit=crop&w=600&h=800&q=80",
  default: "https://images.unsplash.com/photo-1506377247377-2a5b3b417ebb?auto=format&fit=crop&w=600&h=800&q=80"
};

/**
 * Tarjeta visual de un vino individual.
 *
 * @component
 * @param {Object}  props                        - Props del componente.
 * @param {Object}  props.vino                   - Objeto con los datos del vino, tal como
 *                                                 lo devuelve la API en `GET /vinos`.
 * @param {string}  props.vino.vino_nombre       - Nombre comercial del vino.
 * @param {string}  props.vino.tipo_nombre       - Tipo de vino ("tinto", "blanco", "rosado",
 *                                                 "espumoso", "rosat"). Usado para seleccionar
 *                                                 la imagen editorial de forma case-insensitive.
 * @param {string}  props.vino.bodega_nombre     - Nombre de la bodega productora.
 * @param {string}  props.vino.zona_origen       - Denominación de origen o zona geográfica.
 * @param {number}  props.vino.anio              - Año de la cosecha (añada). Puede ser `null`;
 *                                                 en ese caso se muestra un guion ("—").
 * @param {string}  props.vino.formato_capacidad - Capacidad del formato en ml (p. ej. "750").
 * @param {string}  [props.vino.copa_nombre]     - Copa de servicio recomendada. Campo opcional;
 *                                                 si no se recibe, la fila de la ficha técnica
 *                                                 no se renderiza.
 *
 * @returns {JSX.Element} Elemento `<article>` con la tarjeta completa del vino.
 *
 * @example
 * // Uso dentro de ListaVinos.jsx:
 * <CardVino key={vino.vino_nombre} vino={vino} />
 */
export default function CardVino({ vino }) {
  const {
    vino_nombre,
    tipo_nombre,
    bodega_nombre,
    zona_origen,
    anio,
    formato_capacidad,
    copa_nombre
  } = vino;

  // Determinar la capacidad limpia
  const capacidadLimpia =  `${formato_capacidad} ml`;

  // Obtener la imagen según el tipo de vino de forma case-insensitive
  const tipoKey = tipo_nombre ? tipo_nombre.toLowerCase().trim() : "default";
  const imageSrc = WINE_IMAGES[tipoKey] || WINE_IMAGES.default;

  return (
    <article className="double-border-frame group w-full max-w-sm mx-auto shadow-md hover:shadow-2xl hover:-translate-y-1 hover:border-canal-border duration-700">
      <div className="double-border-frame-inner p-6 flex flex-col gap-6 h-full justify-between">
        
        {/* --- Contenedor de la Imagen Editorial del Vino --- */}
        <div className="relative w-full aspect-[3/4] overflow-hidden bg-canal-alt border border-canal-border/20 shadow-inner">
          <img
            src={imageSrc}
            alt={`${vino_nombre} - ${tipo_nombre}`}
            loading="lazy"
            className="w-full h-full object-cover transition-transform duration-[1.5s] ease-out group-hover:scale-105"
          />
          {/* Tag de Tipo de Vino Superpuesto */}
          <div className="absolute top-4 right-4 bg-canal-bg/95 border border-canal-border/40 py-1.5 px-3.5 shadow-sm">
            <span className="font-sans-humanist text-[9px] uppercase tracking-[0.2em] font-semibold text-canal-text">
              {tipo_nombre}
            </span>
          </div>
        </div>

        {/* --- Información Detallada del Vino --- */}
        <div className="flex flex-col flex-grow text-center items-center justify-between gap-4">
          
          {/* Títulos y Bodega */}
          <div className="flex flex-col gap-2 w-full">
            {/* Bodega en tipografía Sans-Serif Humanista */}
            <span className="font-sans-humanist text-[10px] uppercase tracking-[0.25em] text-canal-secondary font-semibold">
              {bodega_nombre}
            </span>
            
            {/* Nombre del Vino en Serif Romana clásica */}
            <h3 className="font-serif-romana text-lg uppercase tracking-[0.12em] text-canal-text font-semibold leading-snug line-clamp-2 px-2">
              {vino_nombre}
            </h3>
            
            {/* Separador sutil */}
            <div className="w-12 h-px bg-canal-border/40 mx-auto my-1"></div>
            
            {/* Zona de Origen en Cursiva Serif elegante */}
            <span className="font-serif-italic italic text-sm text-canal-secondary tracking-wide lowercase">
              {zona_origen}
            </span>
          </div>

          {/* Ficha Técnica de la Bodega (Añada, Copa y Capacidad) */}
          <div className="w-full border-t border-canal-border/10 pt-4 mt-2 flex flex-col gap-2">
            <div className="flex justify-between items-center text-[10px] uppercase tracking-wider text-canal-secondary font-medium">
              <span className="font-sans-humanist text-[9px] opacity-75">Any / Añada</span>
              <span className="font-sans-humanist text-canal-text font-semibold">{anio || "—"}</span>
            </div>
            
            {/* Copa recomendada y capacidad en fila */}
            <div className="flex justify-between items-center text-[10px] uppercase tracking-wider text-canal-secondary font-medium border-t border-canal-border/5 pt-2">
              <span className="font-sans-humanist text-[9px] opacity-75">Format / Formato</span>
              <span className="font-sans-humanist text-canal-text font-semibold">{capacidadLimpia}</span>
            </div>

            {copa_nombre && (
              <div className="flex justify-between items-center text-[10px] uppercase tracking-wider text-canal-secondary font-medium border-t border-canal-border/5 pt-2">
                <span className="font-sans-humanist text-[9px] opacity-75">Copa de Servei</span>
                <span className="font-sans-humanist text-canal-text text-right font-semibold max-w-[65%] truncate">
                  {copa_nombre}
                </span>
              </div>
            )}
          </div>
        </div>

      </div>
    </article>
  );
}


