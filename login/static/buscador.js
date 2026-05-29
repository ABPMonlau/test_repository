document.addEventListener("DOMContentLoaded", function () {
    const buscador = document.getElementById("buscador");
    const filas = document.querySelectorAll(".fila-vino");
    const sinResultados = document.getElementById("sin-resultados");

    if (buscador) {
        buscador.addEventListener("keyup", function () {
            // Convertimos lo que el usuario escribe a minúsculas
            const textoBusqueda = buscador.value.toLowerCase();
            let filasVisibles = 0;

            filas.forEach(function (fila) {
                // Extraemos el texto de las 4 columnas principales
                const nombre = fila.querySelector(".col-nombre").textContent.toLowerCase();
                const tipo = fila.querySelector(".col-tipo").textContent.toLowerCase();
                const bodega = fila.querySelector(".col-bodega").textContent.toLowerCase();
                const zona = fila.querySelector(".col-zona").textContent.toLowerCase();

                // Buscamos coincidencias
                if (nombre.includes(textoBusqueda) || tipo.includes(textoBusqueda) ||
                    bodega.includes(textoBusqueda) || zona.includes(textoBusqueda)) {
                    fila.style.display = "";
                    filasVisibles++;
                } else {
                    fila.style.display = "none";
                }
            });

            // Mostramos el mensaje si no hay resultados
            if (filasVisibles === 0 && filas.length > 0) {
                sinResultados.style.display = "";
            } else {
                sinResultados.style.display = "none";
            }
        });
    }
});