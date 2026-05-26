---
name: design-guidelines
description: |
  Esta skill contiene la guía de estilo y las directrices de diseño del Restaurant La Canal (Tona) para asegurar una coherencia visual en el desarrollo de la interfaz front-end del sitio web oficial.
---

# Guía de Estilo y Directrices de Diseño Front-End: Restaurant La Canal

Este documento recopila la identidad visual y las directrices de diseño extraídas de la papelería y menús impresos del **Restaurant La Canal** (Tona). El objetivo es servir como especificación técnica (*Design Guidelines*) para agentes de IA y desarrolladores de front-end encargados de construir la plataforma web oficial del restaurante, garantizando una transición impecable del diseño físico al entorno digital.

---

## 1. Filosofía de Marca e Identidad Visual

La propuesta visual del restaurante refleja directamente su filosofía culinaria: **"Cuina honesta, de gust, producte i temporalitat... una cuina sense presses"**. 

A nivel de UI/UX, esto se traduce en:
* **Minimalismo y Elegancia:** Diseños limpios con un uso muy generoso del espacio en blanco (*whitespace*), evitando la saturación de elementos.
* **Enfoque Clásico / Contemporáneo:** Una combinación armónica entre tipografías serif clásicas (que evocan tradición y arraigo) y estructuras limpias y modernas.
* **Estructura Centrada:** Todo el contenido fluye de manera simétrica alrededor de un eje central, transmitiendo equilibrio, serenidad y orden.

---

## 2. Paleta de Colores (Color Palette)

La paleta es orgánica, cálida y de contraste suave. Evita los negros puros y los blancos brillantes de pantalla, optando por tonos que emulan texturas naturales y sofisticadas.

| Elemento | Uso en Front-End | Código HEX Sugerido | Descripción Visual |
| :--- | :--- | :--- | :--- |
| **Fondo Principal (Sólido)** | Fondos de página, tarjetas de menú, secciones de manifiesto. | `#FAF6F0` | Marfil / Crema cálido mate muy suave. |
| **Fondo Alternativo (Textura)** | Secciones hero, landings de menús gastronómicos destacados. | `url('marble-light.jpg')` o `#F3EFE9` | Textura sutil que simula mármol travertino o piedra caliza muy clara. |
| **Texto Principal** | Títulos de secciones, nombres de platos y textos descriptivos. | `#1C1B1A` | Antracita / Negro carbón atenuado (suaviza la lectura en pantallas). |
| **Bordes y Delimitadores** | Marcos perimetrales dobles, líneas divisorias horizontales. | `#A8A396` | Gris taupe / Bronce envejecido muy fino. |
| **Textos Secundarios / Precios** | Detalles de menús, suplementos (`supl. 8€`), notas de IVA. | `#59544B` | Marrón ceniza / Gris cálido de contraste medio. |

---

## 3. Tipografía (Typography)

La jerarquía tipográfica es el pilar central de esta identidad visual. Se compone de tres familias o estilos tipográficos claramente diferenciados:

### A. Títulos Principales y Categorías (Serif Romana)
* **Uso:** Logotipo secundario, encabezados de menú (`MENÚ INTERLUDI`, `MENÚ DEL DIA`), y nombres de categorías (`PRIMERS`, `SEGONS`, `POSTRES`, `PLATS`).
* **Características:** Tipografía Serif de proporciones romanas clásicas, de trazo elegante y serifas esbeltas. Se utiliza **siempre en mayúsculas (All Caps)**.
* **Alternativas Web (Google Fonts):** `Cinzel`, `Cormorant Garamond` (con `text-transform: uppercase`), o `Playfair Display`.
* **Estilo CSS recomendado:**
    ```css
    font-family: 'Cinzel', 'Cormorant Garamond', serif;
    text-transform: uppercase;
    letter-spacing: 0.15em;
    font-weight: 400;
    color: #1C1B1A;
    ```

### B. Nombres de Platos y Textos de Manifiesto (Sans-Serif Humanista / Limpia)
* **Uso:** Nombres de los platos principales de la carta, texto corrido de presentación del restaurante.
* **Características:** Tipografía Sans-Serif geométrica o humanista, muy limpia, con peso ligero o regular (*light/regular*). Ofrece un contraste moderno frente a las serifas de los títulos.
* **Alternativas Web (Google Fonts):** `Montserrat` (pesos 300/400), `Inter` (peso 300), o `Lato`.
* **Estilo CSS recomendado:**
    ```css
    font-family: 'Montserrat', sans-serif;
    font-weight: 300;
    letter-spacing: 0.02em;
    line-height: 1.6;
    color: #1C1B1A;
    ```

### C. Descripciones, Ingredientes y Notas (Serif Cursiva / Italic)
* **Uso:** Explicación de los ingredientes debajo de cada plato (`mel i mandarina fermentada`, `amb textures de remolatxa`), subtítulos menores o detalles adicionales.
* **Características:** Serif en formato itálico (*Italic*) de estilo caligráfico o clásico, muy fluida y orgánica, siempre en minúsculas.
* **Alternativas Web (Google Fonts):** `Cormorant Garamond` (Italic, peso 400) o `Baskerville` (Italic).
* **Estilo CSS recomendado:**
    ```css
    font-family: 'Cormorant Garamond', serif;
    font-style: italic;
    font-weight: 400;
    font-size: 1.1rem;
    color: #59544B;
    ```

---

## 4. Componentes de Interfaz y Reglas de Layout (UI & Layout)

Para replicar de forma fidedigna la experiencia visual de los menús en la web, se deben aplicar las siguientes reglas constructivas en CSS:

### 1. El Marco Perimetral Doble (*Double Inset Border*)
Todas las secciones principales (como las tarjetas de menú o el bloque del manifiesto de los tres cocineros) están delimitadas por un doble marco característico:
* Un borde exterior muy fino.
* Un espacio interior (*padding* de separación).
* Un borde interior idéntico o ligeramente más marcado.

**Implementación sugerida en CSS:**
```css
.card-menu {
    border: 1px solid #A8A396;
    padding: 6px; /* Espacio entre los dos bordes */
    background-color: #FAF6F0;
}
.card-menu-inner {
    border: 1px solid #A8A396;
    padding: 40px 30px; /* Margen interno para el contenido */
}