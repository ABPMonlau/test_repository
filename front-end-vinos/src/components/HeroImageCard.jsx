/**
 * HeroImageCard - Componente modular para las imágenes del colaje del Hero.
 * 
 * Permite renderizar imágenes con el marco perimetral doble oficial, 
 * etiquetas descriptivas interactivas en cursiva caligráfica,
 * efectos de hover avanzados y optimización de rendimiento de carga.
 * 
 * NOTA DE DISEÑO (CSS): Se utilizan posicionamientos absolutos internos (inset) 
 * en lugar de w-full/h-full para evitar colapsos de altura cíclicos en navegadores 
 * al combinar absolute, porcentajes de ancho y aspect-ratio.
 */
export default function HeroImageCard({
  src,
  alt,
  label,
  className = "",
  hasDoubleBorder = true,
  fetchPriority = "low",
  onClick
}) {
  return (
    <div 
      onClick={onClick}
      className={`group cursor-pointer transition-all duration-700 relative ${
        hasDoubleBorder 
          ? "double-border-frame shadow-2xl" 
          : "overflow-hidden rounded-xl border border-canal-border/20 shadow-xl hover:scale-105 hover:shadow-2xl"
      } ${className}`}
    >
      <div className={hasDoubleBorder ? "double-border-frame-inner absolute inset-[6px] overflow-hidden" : "absolute inset-0 overflow-hidden"}>
        <img
          src={src}
          alt={alt}
          fetchpriority={fetchPriority}
          className="w-full h-full object-cover transition-transform duration-[1.2s] ease-out group-hover:scale-105"
        />
        {label && (
          <div className="absolute bottom-6 left-6 bg-canal-bg/95 border border-canal-border/40 py-2 px-4 shadow-sm opacity-0 group-hover:opacity-100 transition-all duration-500 transform translate-y-2 group-hover:translate-y-0 pointer-events-none z-30">
            <span className="font-serif-italic italic text-xs text-canal-secondary tracking-widest lowercase">
              {label}
            </span>
          </div>
        )}
      </div>
    </div>
  );
}
