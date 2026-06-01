
const API_URL = "http://localhost:8081"; // Cambia esto por la IP de tu Raspberry si es necesario

async function testConnection() {
  console.log(`--- Testejant connexió a: ${API_URL} ---`);
  
  try {
    // 1. Test de disponibilidad (POST)
    console.log("1. Provant /buscar/libres...");
    const resTables = await fetch(`${API_URL}/buscar/libres`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ 
        guests: 2,
        shift: { timeShift: "comida" }
      })
    });
    console.log("Status:", resTables.status);
    if (resTables.ok) console.log("Resultat:", await resTables.json());

    // 2. Test de cliente (POST)
    console.log("\n2. Provant /agregar/cliente...");
    const resClient = await fetch(`${API_URL}/agregar/cliente`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ name: "Test", phone: "600000000", email: "test@example.com", bookDate: "2026-06-01" })
    });
    console.log("Status:", resClient.status);
    console.log("Resultat:", await resClient.text());

  } catch (err) {
    console.error("\n❌ ERROR DE CONNEXIÓ:");
    console.error(err.message);
    console.log("\nPossibles causes:");
    console.log("- El backend no està corrent.");
    console.log("- L'URL/IP és incorrecta.");
    console.log("- Problemes de CORS (el backend ha de permetre peticions des del port del frontend).");
  }
}

testConnection();
