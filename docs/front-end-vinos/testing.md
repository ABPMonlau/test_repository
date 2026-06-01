# 🧪 Guía de Testing del Frontend — front-end-vinos

Esta guía técnica está diseñada para el equipo de **ABP La Canal** con el fin de explicar, configurar y ejecutar de forma sencilla las pruebas de software (Testing) en la aplicación frontend de React.

Dado que nuestro frontend es una interfaz dinámica moderna maquetada en Vite, dividimos la estrategia de testing del cliente en dos niveles:
1. **Tests Unitarios de Componentes (Vitest + React Testing Library):** Pruebas ultra rápidas en un navegador virtual en memoria (`jsdom`) para verificar componentes visuales aislados.
2. **Tests End-to-End (E2E) (Playwright):** Pruebas del flujo completo simulando a un usuario real interactuando con el navegador, utilizando **API Mocking** para que pasen siempre con éxito sin depender del servidor Flask.

---

## 🗺️ Estructura del Testing en el Frontend

Las pruebas del cliente se encuentran completamente autocontenidas dentro de `front-end-vinos/` (dejando la raíz del proyecto libre de archivos JavaScript/Node):
```text
front-end-vinos/
├── src/
│   ├── setupTests.js               # Inyección global de matchers de HTML (jest-dom)
│   └── components/
│       └── CardVino.test.jsx       # Tests unitarios del componente de tarjeta de vino
├── tests-e2e/                      # Ubicado dentro de front-end-vinos/
│   └── vinos_flow.spec.js          # Test E2E de Playwright del catálogo de vinos
├── vite.config.js                  # Configuración de Vitest/jsdom
├── playwright.config.js            # Configuración de Playwright/Chromium
└── package.json                    # Scripts NPM de ejecución rápida (tanto Vitest como Playwright)
```

---

## ⚛️ 1. Tests Unitarios (Vitest + React Testing Library)

Las pruebas unitarias nos permiten renderizar un componente de React (como `CardVino.jsx`) en un DOM virtual en memoria (gestionado por `jsdom`) para verificar que muestra los textos correspondientes, carga imágenes según props y controla los datos vacíos.

### A. Dependencias e Instalación
Para instalar las herramientas en vuestra máquina, ejecuta en la carpeta `front-end-vinos/`:
```bash
npm install -D vitest @testing-library/react @testing-library/jest-dom jsdom
```

### B. Configuración de Vite y Vitest
En `vite.config.js`, habilitamos el bloque `test` para usar `jsdom` y declarar las directivas globales:
```javascript
test: {
  globals: true,
  environment: 'jsdom',
  setupFiles: './src/setupTests.js',
}
```

Y en `src/setupTests.js` añadimos la importación de matchers para comprobar el HTML de forma intuitiva:
```javascript
import '@testing-library/jest-dom';
```

### C. El Test Unitario: `CardVino.test.jsx`
El archivo de pruebas se encuentra en `src/components/CardVino.test.jsx`. Este test contiene 3 casos prácticos validados:

```javascript
import { render, screen } from '@testing-library/react';
import { describe, it, expect } from 'vitest';
import CardVino from './CardVino';

describe('Componente <CardVino />', () => {
  const mockVino = {
    vino_nombre: 'Gran Clot del Canal',
    tipo_nombre: 'Tinto',
    bodega_nombre: 'Celler La Canal',
    zona_origen: 'D.O. Penedès',
    anio: 2019,
    formato_capacidad: '750',
    copa_nombre: 'Copa Burdeos'
  };

  it('debe renderizar correctamente la información básica del vino', () => {
    // 1. ARRANGE & ACT: Renderizamos el componente con props de prueba
    render(<CardVino vino={mockVino} />);

    // 2. ASSERT: Buscamos si los textos clave están visibles en pantalla
    expect(screen.getByText('Gran Clot del Canal')).toBeInTheDocument();
    expect(screen.getByText('Celler La Canal')).toBeInTheDocument();
    expect(screen.getByText('D.O. Penedès')).toBeInTheDocument();
    expect(screen.getByText('750 ml')).toBeInTheDocument();
    expect(screen.getByText('Copa Burdeos')).toBeInTheDocument();
  });

  it('debe resolver la imagen correcta basada en el tipo de vino (case-insensitive)', () => {
    render(<CardVino vino={mockVino} />);

    const imagen = screen.getByRole('img');
    
    // Comprobamos atributos HTML
    expect(imagen).toHaveAttribute('alt', 'Gran Clot del Canal - Tinto');
    expect(imagen).toHaveAttribute('src', 'https://images.unsplash.com/photo-1584916201218-f4242ceb4809?auto=format&fit=crop&w=600&h=800&q=80');
  });

  it('debe mostrar un guion "—" si el año (añada) es nulo o ausente', () => {
    const vinoSinAnio = { ...mockVino, anio: null };
    render(<CardVino vino={vinoSinAnio} />);

    // Comprobamos que el fallback visual funcione
    expect(screen.getByText('—')).toBeInTheDocument();
  });
});
```

### D. Cómo ejecutar los tests unitarios
Ejecuta el siguiente comando dentro de la carpeta `front-end-vinos/`:
```bash
npm run test
```
*Vitest se abrirá por defecto en modo observador (watch). Si modificas cualquier archivo del test o del componente, la prueba se volverá a ejecutar en décimas de segundo automáticamente.*

---

## 🌐 2. Tests End-to-End (E2E) con Playwright

Las pruebas **E2E (Extremo a Extremo)** simulan flujos de usuario reales levantando un navegador real. Nuestro test comprueba que un comensal puede entrar a la home de **La Canal**, pulsar el botón "El Celler" en el NavBar, cambiar de página a la carta de vinos y ver las tarjetas renderizadas.

### A. Estabilidad con API Mocking
> [!TIP]
> **Consejo técnico de Oro:** Si conectáramos Playwright con el servidor de Flask real, el test fallaría si la base de datos está caída o si la API está apagada. 
> Para evitar esto, usamos **API Mocking** de Playwright: interceptamos la petición de red a `**/vinos` y le inyectamos una respuesta JSON simulada en milisegundos. ¡Esto garantiza que el test sea robusto e independiente!

### B. El Test E2E: `vinos_flow.spec.js`
El test reside en `tests-e2e/vinos_flow.spec.js` a nivel de raíz del repositorio:

```javascript
import { test, expect } from '@playwright/test';

test.describe('Flujo de la Carta de Vinos — Restaurante La Canal', () => {
  
  test('Debe navegar desde la Home al Celler y listar las tarjetas de vinos mockeando la API', async ({ page }) => {
    // 1. MOCK DE RED: Interceptamos la petición a la API y devolvemos un vino mock
    await page.route('**/vinos', async (route) => {
      const mockVinos = [
        {
          vino_nombre: "Gran Clot del Canal E2E",
          tipo_nombre: "Tinto",
          bodega_nombre: "Celler La Canal",
          zona_origen: "D.O. Penedès",
          anio: 2020,
          formato_capacidad: "750",
          copa_nombre: "Copa Burdeos"
        }
      ];
      await route.fulfill({
        status: 200,
        contentType: 'application/json',
        body: JSON.stringify(mockVinos),
      });
    });

    // 2. Navegar a la Home (localhost:5173/)
    await page.goto('/');

    // 3. Comprobar que la cabecera está cargada
    await expect(page.locator('header')).toContainText(/La Canal/i);

    // 4. Navegar pulsando el botón "El Celler"
    const linkCeller = page.locator('header nav').getByText("El Celler");
    await linkCeller.click();

    // 5. Verificar cambio de ruta a /celler
    await expect(page).toHaveURL(/\/celler/);

    // 6. Verificar presencia del título de El Celler
    await expect(page.locator('h1')).toContainText(/El Celler/i);

    // 7. Comprobar que la tarjeta de vino mockeada se renderiza en la UI
    const tarjetaVino = page.locator('article');
    await expect(tarjetaVino.first()).toBeVisible();

    // 8. Verificar los datos del vino en la tarjeta
    await expect(tarjetaVino.locator('h3')).toContainText('Gran Clot del Canal E2E');
    await expect(tarjetaVino).toContainText('Celler La Canal');
    await expect(tarjetaVino).toContainText('750 ml');
  });
});
```

### C. Cómo ejecutar los tests E2E
Abre tu terminal dentro de la carpeta del frontend (`front-end-vinos/`) y ejecuta:

- **Modo Consola (Rápido y limpio):**
  ```bash
  npm run test:e2e
  ```
- **Modo UI Interactivo (Recomendado para la presentación/defensa de clase):**
  ```bash
  npm run test:e2e:ui
  ```
  *Este modo abrirá una ventana interactiva donde verás el navegador ejecutando la navegación del test en vivo paso a paso, permitiéndote depurar y enseñar el flujo de forma espectacular.*

---

## 📚 Glosario Rápido para la Memoria del Proyecto

Cuando documentes este apartado en la memoria de vuestra asignatura de ingeniería del software, podéis emplear estos términos oficiales:

* **jsdom:** Un entorno ligero en memoria que emula por completo las APIs de un navegador web estándar. Permite correr tests unitarios de React en Node.js de forma ultra veloz.
* **Component Rendering:** Acción de instanciar y dibujar un componente de React de forma aislada en el DOM virtual para inspeccionar sus etiquetas HTML y su comportamiento.
* **API Mocking (Playwright `page.route`):** Técnica para simular endpoints HTTP simulando respuestas JSON del servidor backend, garantizando la independencia y estabilidad del test frontend.
* **AAA Pattern:** Estructura limpia de tests dividida en:
  * **Arrange (Preparar):** Preparar las props del vino y mocks.
  * **Act (Actuar):** Renderizar el componente o hacer clics en la web.
  * **Assert (Verificar):** Validar con `expect` que el texto esté visible o la URL sea correcta.
