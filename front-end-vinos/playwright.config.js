import { defineConfig, devices } from '@playwright/test';

export default defineConfig({
  testDir: './tests-e2e', // Carpeta de pruebas E2E dentro del frontend
  fullyParallel: true,
  reporter: 'html',
  use: {
    baseURL: 'http://localhost:5173', // URL de la app de React en desarrollo
    trace: 'on-first-retry',
  },
  
  // Limitamos a Chromium para mantener la instalación ligera en equipos de estudiantes
  projects: [
    {
      name: 'chromium',
      use: { ...devices['Desktop Chrome'] },
    },
  ],
  
  // Levanta el servidor de React antes de correr las pruebas
  webServer: {
    command: 'npm run dev',
    url: 'http://localhost:5173',
    reuseExistingServer: true,
  },
});
