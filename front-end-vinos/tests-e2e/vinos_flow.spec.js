import { test, expect } from '@playwright/test';

test.describe('Flujo de la Carta de Vinos — Restaurante La Canal', () => {

  test('Debe navegar desde la Home al Celler y listar las tarjetas de vinos mockeando la API', async ({ page }) => {
    // 1. MOCK DE API: Interceptamos cualquier llamada a la API de vinos y devolvemos datos controlados.
    // Esto garantiza que el test sea robusto y pase incluso si el servidor Flask está apagado.
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

    // 2. Navegar a la página principal de la aplicación web (React)
    await page.goto('/');

    // 3. Comprobar que el título tipográfico de "La Canal" está visible en el NavBar o Hero
    await expect(page.locator('header')).toContainText(/La Canal/i);

    // 4. Hacer clic en el enlace "El Celler" en el NavBar para ir a la sección de vinos
    const linkCeller = page.locator('header nav').getByText("El Celler");
    await linkCeller.click();

    // 5. Verificar que la URL ha cambiado a la sección /celler
    await expect(page).toHaveURL(/\/celler/);

    // 6. Comprobar que el título de la página del celler es correcto
    await expect(page.locator('h1')).toContainText(/El Celler/i);

    // 7. Esperar a que la tarjeta del vino mockeado esté pintada en la pantalla
    const tarjetaVino = page.locator('article');
    await expect(tarjetaVino.first()).toBeVisible();

    // 8. Validar los detalles de la tarjeta de vino que proviene de nuestra API mockeada
    await expect(tarjetaVino.locator('h3')).toContainText('Gran Clot del Canal E2E');
    await expect(tarjetaVino).toContainText('Celler La Canal');
    await expect(tarjetaVino).toContainText('D.O. Penedès');
    await expect(tarjetaVino).toContainText('750 ml');
    
    console.log('[E2E Success] El flujo de navegación y listado de vinos funciona perfectamente!');
  });
});
