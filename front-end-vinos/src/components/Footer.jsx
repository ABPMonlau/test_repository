import {Link} from "react-router-dom";

export default function Footer() {
  return (
    <footer className="w-full bg-canal-alt border-t border-canal-border/20 py-16 md:py-16 px-6">
      <div className="max-w-350 mx-auto flex flex-col items-center">
        <div className="flex flex-col items-center text-center gap-8 w-full max-w-xl">
          {/* Logo / Nombre */}
          <Link
            to="/"
            onClick={() => {
              if (window.location.pathname === "/") {
                window.scrollTo({top: 0, behavior: "smooth"});
              }
            }}
            className="group flex flex-col items-center gap-2 focus:outline-none"
          >
            <span className="font-serif-romana text-2xl md:text-3xl uppercase tracking-[0.3em] text-canal-text group-hover:opacity-75 transition-opacity duration-300">
              La Canal
            </span>
            <span className="font-serif-italic italic text-xs md:text-sm text-canal-secondary tracking-wide">
              cuina honesta i de producte
            </span>
          </Link>

          {/* Caja Central con Doble Borde para Contacto e Instagram */}
          <div className="double-border-frame w-full shadow-md hover:shadow-lg transition-all duration-700">
            <div className="double-border-frame-inner px-6 py-8 md:px-12 md:py-10 flex flex-col items-center gap-6">
              {/* Dirección */}
              <div className="flex flex-col items-center gap-1 text-center">
                <span className="font-sans-humanist text-[9px] uppercase tracking-[0.25em] text-canal-secondary font-bold">
                  Direcció
                </span>
                <a
                  href="https://maps.google.com/?q=Carrer+Maria+Vivet,+1,+08551+Tona,+Barcelona"
                  target="_blank"
                  rel="noopener noreferrer"
                  className="font-sans-humanist text-xs md:text-sm text-canal-text hover:text-canal-secondary transition-colors duration-300 font-light tracking-wide"
                >
                  Carrer Maria Vivet, 1 • 08551 Tona, Barcelona
                </a>
              </div>

              {/* Teléfono / Contacto */}
              <div className="flex flex-col items-center gap-1 text-center">
                <span className="font-sans-humanist text-[9px] uppercase tracking-[0.25em] text-canal-secondary font-bold">
                  Contacte
                </span>
                <a
                  href="tel:+34938125333"
                  className="font-sans-humanist text-xs md:text-sm text-canal-text hover:text-canal-secondary transition-colors duration-300 font-light tracking-wide"
                >
                  T. +34 938 12 53 33
                </a>
              </div>

              {/* Separador fino */}
              <div className="w-12 h-px bg-canal-border/40 my-1"></div>

              {/* Enlace Instagram */}
              <a
                href="https://www.instagram.com/lacanal_tona"
                target="_blank"
                rel="noopener noreferrer"
                className="group flex items-center gap-2 px-5 py-2 border border-canal-border/40 text-canal-text hover:text-canal-bg font-sans-humanist uppercase text-[10px] tracking-[0.22em] font-semibold hover:bg-canal-text  transition-all duration-500 ease-out active:scale-95 cursor-pointer rounded-none"
              >
                <svg
                  className="w-4 h-4 transition-transform duration-500 group-hover:scale-110"
                  fill="currentColor"
                  viewBox="0 0 24 24"
                  aria-hidden="true"
                >
                  <path d="M12 2.163c3.204 0 3.584.012 4.85.07 3.252.148 4.771 1.691 4.919 4.919.058 1.265.069 1.645.069 4.849 0 3.205-.012 3.584-.069 4.849-.149 3.225-1.664 4.771-4.919 4.919-1.266.058-1.644.07-4.85.07-3.204 0-3.584-.012-4.849-.07-3.26-.149-4.771-1.699-4.919-4.92-.058-1.265-.07-1.644-.07-4.849 0-3.204.013-3.583.07-4.849.149-3.227 1.664-4.771 4.919-4.919 1.266-.057 1.645-.069 4.849-.069zM12 0C8.741 0 8.333.014 7.053.072 2.695.272.273 2.69.073 7.051.014 8.333 0 8.741 0 12c0 3.259.014 3.668.072 4.948.2 4.358 2.618 6.78 6.98 6.98 1.281.058 1.689.072 4.948.072 3.259 0 3.668-.014 4.948-.072 4.354-.2 6.782-2.618 6.979-6.98.059-1.28.073-1.689.073-4.948 0-3.259-.014-3.667-.072-4.947-.196-4.354-2.617-6.78-6.979-6.98C15.668.014 15.259 0 12 0zm0 5.838a6.162 6.162 0 100 12.324 6.162 6.162 0 000-12.324zM12 16a4 4 0 110-8 4 4 0 010 8zm6.406-11.845a1.44 1.44 0 100 2.881 1.44 1.44 0 000-2.881z" />
                </svg>
                <span>Instagram</span>
              </a>
            </div>
          </div>

          {/* Pie de página con copyright */}
          <div className="flex flex-col items-center gap-1.5 mt-4 text-[10px] font-sans-humanist tracking-widest text-canal-secondary opacity-60">
            <span>
              © {new Date().getFullYear()} RESTAURANT LA CANAL. TOTS ELS DRETS
              RESERVATS.
            </span>
            <span className="text-[8px] tracking-[0.2em] uppercase font-light">
              Cuina honesta, de gust, producte i temporalitat
            </span>
          </div>
        </div>
      </div>
    </footer>
  );
}
