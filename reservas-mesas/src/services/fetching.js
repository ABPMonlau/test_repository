const back_URL = import.meta.env.VITE_API_BASE_URL || "http://localhost:3306";

/**
 * Consulta la disponibilidad de mesas para un número de comensales.
 * Llama a GET /buscar/libres en el backend de Spring Boot con el cuerpo JSON esperado.
 */
export const getAvailableTables = async (comensales) => {
  try {
    const response = await fetch(`${back_URL}/buscar/libres`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        guests: comensales
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

    const text = await response.text();
    try {
      return JSON.parse(text);
    } catch {
      return text; // Puede devolver texto plano "Successfully created"
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
