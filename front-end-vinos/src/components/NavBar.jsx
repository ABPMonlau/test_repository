import { useState } from 'react'

export default function NavBar() {
  const [isOpen, setIsOpen] = useState(false);

  // --- CONFIGURACIÓN DEL LOGO DEL RESTAURANTE ---
  // Si tienes un archivo de logo (ej. PNG o SVG), puedes poner la ruta aquí (ej. "/logo.svg" o importar el recurso).
  // Si se deja vacío (null o ""), el componente mostrará automáticamente el elegante texto tipográfico oficial.
  const logoUrl = ""; 

  const handleReservationClick = () => {
    setIsOpen(false);
    alert("Redirigint al sistema de reserves de taules...");
  };

  return (
    <header className="sticky top-0 z-50 bg-canal-bg/90 backdrop-blur-md border-b border-canal-border/20 transition-all duration-300">
      <div className="max-w-[1400px] mx-auto px-6 md:px-12 py-5 flex items-center justify-between lg:grid lg:grid-cols-3">
        
        {/* Lado Izquierdo: Enlaces (Escritorio) */}
        <nav className="hidden lg:flex items-center gap-8 justify-start">
          <a href="#carta" className="font-sans-humanist text-xs uppercase tracking-[0.15em] text-canal-secondary hover:text-canal-text transition-colors duration-300 font-medium">
            La Carta
          </a>
          <a href="#menus" className="font-sans-humanist text-xs uppercase tracking-[0.15em] text-canal-secondary hover:text-canal-text transition-colors duration-300 font-medium">
            Menús
          </a>
          <a href="#celler" className="font-sans-humanist text-xs uppercase tracking-[0.15em] text-canal-secondary hover:text-canal-text transition-colors duration-300 font-medium">
            El Celler 
          </a>
        </nav>

        {/* Centro: Logotipo Simétrico (Imagen o Texto Fallback) */}
        <div className="flex justify-start lg:justify-center items-center">

          
          <a href="/" className="flex items-center justify-center group">
            {logoUrl ? (
              <img 
                src={logoUrl} 
                alt="Logotip Restaurant La Canal" 
                className="h-10 w-auto object-contain transition-transform duration-500 group-hover:scale-105"
              />
            ) : (
              <span className="font-serif-romana text-xl md:text-2xl uppercase tracking-[0.25em] text-canal-text hover:opacity-80 transition-opacity font-normal">
                La Canal
              </span>
            )}
          </a>
        </div>

        {/* Lado Derecho: Enlace y CTA (Escritorio) */}
        <div className="hidden lg:flex items-center gap-8 justify-end">
          <a href="#filosofia" className="font-sans-humanist text-xs uppercase tracking-[0.15em] text-canal-secondary hover:text-canal-text transition-colors duration-300 font-medium">
            Filosofia
          </a>
          <button
            onClick={handleReservationClick}
            className="px-6 py-2.5 border border-canal-border hover:border-canal-text text-canal-text font-sans-humanist uppercase text-[10px] tracking-[0.2em] font-semibold hover:bg-canal-text hover:text-canal-bg transition-all duration-500 ease-out cursor-pointer active:scale-95"
          >
            Reserves
          </button>
        </div>

        {/* Hamburguesa (Móvil) */}
        <div className="flex lg:hidden">
          <button 
            onClick={() => setIsOpen(!isOpen)} 
            className="text-canal-text p-1 cursor-pointer focus:outline-none"
            aria-label="Toggle menu"
          >
            <svg className="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              {isOpen ? (
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={1.5} d="M6 18L18 6M6 6l12 12" />
              ) : (
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={1.5} d="M4 6h16M4 12h16M4 18h16" />
              )}
            </svg>
          </button>
        </div>

      </div>

      {/* Menú Desplegable Móvil */}
      <div 
        className={`lg:hidden transition-all duration-500 ease-in-out border-b border-canal-border/20 overflow-hidden ${
          isOpen ? 'max-h-screen opacity-100 bg-canal-bg' : 'max-h-0 opacity-0'
        }`}
      >
        <div className="px-6 py-8 flex flex-col items-center">
          
          {/* Tarjeta con Doble Borde para el Menú Móvil */}
          <div className="border border-canal-border/40 p-1 w-full max-w-xs bg-canal-bg">
            <div className="border border-canal-border/40 py-8 px-4 flex flex-col gap-6 items-center text-center">
              
              <a 
                href="#carta" 
                onClick={() => setIsOpen(false)} 
                className="font-sans-humanist text-xs uppercase tracking-[0.15em] text-canal-secondary hover:text-canal-text transition-colors duration-300 font-medium"
              >
                La Carta
              </a>
              <a 
                href="#menus" 
                onClick={() => setIsOpen(false)} 
                className="font-sans-humanist text-xs uppercase tracking-[0.15em] text-canal-secondary hover:text-canal-text transition-colors duration-300 font-medium"
              >
                Menús
              </a>
              <a 
                href="#celler" 
                onClick={() => setIsOpen(false)} 
                className="font-sans-humanist text-xs uppercase tracking-[0.15em] text-canal-secondary hover:text-canal-text transition-colors duration-300 font-medium"
              >
                El Celler
              </a>
              <a 
                href="#filosofia" 
                onClick={() => setIsOpen(false)} 
                className="font-sans-humanist text-xs uppercase tracking-[0.15em] text-canal-secondary hover:text-canal-text transition-colors duration-300 font-medium"
              >
                Filosofia
              </a>
              
              <div className="w-8 h-[1px] bg-canal-border/40 my-1"></div>
              
              <button
                onClick={handleReservationClick}
                className="px-8 py-3 border border-canal-text/80 text-canal-text font-sans-humanist uppercase text-[10px] tracking-[0.2em] font-semibold hover:bg-canal-text hover:text-canal-bg transition-all duration-300 ease-out cursor-pointer active:scale-95"
              >
                Reserves
              </button>
              
            </div>
          </div>
          
        </div>
      </div>
    </header>
  );
}
