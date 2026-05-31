import { render, screen } from '@testing-library/react';
import { describe, it, expect } from 'vitest';
import CardVino from './CardVino';

describe('Componente <CardVino />', () => {
  // Datos simulados de un vino (mock) que cumple con la estructura esperada
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
    // 1. ARRANGE & ACT: Renderizamos el componente con las props
    render(<CardVino vino={mockVino} />);

    // 2. ASSERT: Buscamos si los textos clave están en el documento
    expect(screen.getByText('Gran Clot del Canal')).toBeInTheDocument();
    expect(screen.getByText('Celler La Canal')).toBeInTheDocument();
    expect(screen.getByText('D.O. Penedès')).toBeInTheDocument();
    expect(screen.getByText('750 ml')).toBeInTheDocument();
    
    // Verificamos que se muestre el texto de la copa recomendada
    expect(screen.getByText('Copa Burdeos')).toBeInTheDocument();
  });

  it('debe resolver la imagen correcta basada en el tipo de vino (case-insensitive)', () => {
    render(<CardVino vino={mockVino} />);

    // El tipo es 'Tinto' (capitalizado), el componente debe resolver la imagen de tipo tinto
    const imagen = screen.getByRole('img');
    
    // Validamos que el alt esté bien formado
    expect(imagen).toHaveAttribute('alt', 'Gran Clot del Canal - Tinto');
    
    // Validamos que apunte a la URL de vino tinto (definida en el mapa de imágenes de CardVino)
    expect(imagen).toHaveAttribute('src', 'https://images.unsplash.com/photo-1584916201218-f4242ceb4809?auto=format&fit=crop&w=600&h=800&q=80');
  });

  it('debe manejar correctamente cuando el año (añada) es nulo o ausente', () => {
    // Escenario con año nulo
    const vinoSinAnio = { ...mockVino, anio: null };
    render(<CardVino vino={vinoSinAnio} />);

    // El componente según su diseño debe mostrar un guion '—' en la añada
    expect(screen.getByText('—')).toBeInTheDocument();
  });
});
