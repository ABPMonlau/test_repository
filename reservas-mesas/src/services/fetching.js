const back_URL = import.meta.env.VITE_API_BASE_URL || "http://localhost:8081";

/**
 * Consulta la disponibilidad de mesas para un número de comensales y un turno.
 * Llama a POST /buscar/libres en el backend de Spring Boot.
 */
export const getAvailableTables = async (comensales, turno) => {
  try {
    const response = await fetch(`${back_URL}/buscar/libres`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        guests: comensales,
        shift: {
          timeShift: turno === 'cena' ? 'noche' : 'comida'
        }
      })
    });
    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`);
    }
    const result = await response.json();
    return result; // Devuelve la lista de mesas libres
  } catch (error) {
    console.error("Error al consultar disponibilidad:", error);
    throw error;
  }
};

/**
 * Registra un nuevo cliente en el backend de Spring Boot.
 * Llama a POST /agregar/cliente.
 */
export const postClient = async (clientData) => {
  try {
    const response = await fetch(`${back_URL}/agregar/cliente`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(clientData)
    });

    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`);
    }

    const contentType = response.headers.get("content-type");
    if (contentType && contentType.includes("application/json")) {
      return await response.json();
    } else {
      const text = await response.text();
      // Si el backend devuelve un ID como texto plano, intentamos parsearlo
      const possibleId = parseInt(text, 10);
      return !isNaN(possibleId) ? { id: possibleId } : text;
    }
  } catch (error) {
    console.error("Error al registrar el cliente:", error);
    throw error;
  }
};

/**
 * Envía la reserva completa para guardarla en la base de datos al final del proceso.
 * Llama a POST /reservar en el backend de Spring Boot.
 */
export const postReservation = async (reservationData) => {
  try {
    const response = await fetch(`${back_URL}/reservar`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(reservationData)
    });

    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`);
    }

    const result = await response.json();
    return result;
  } catch (error) {
    console.error("Error al guardar la reserva:", error);
    throw error;
  }
};
