import pytest
from app import app

# Creamos una fixture de pytest para configurar el cliente de pruebas de Flask
@pytest.fixture
def client():
    app.config["TESTING"] = True
    with app.test_client() as client:
        yield client

def test_get_vinos_success(client, mocker):
    """
    Caso de Prueba: Verificar que GET /vinos responde con código 200
    y devuelve la lista de vinos simulada (mock) correctamente.
    """
    # 1. ARRANGE (Preparar el escenario)
    # Simulamos lo que devolvería la función get_all_vinos de la BBDD
    vinos_simulados = [
        {
            "vino_nombre": "La Canal Crianza",
            "tipo_nombre": "Tinto",
            "bodega_nombre": "Bodega La Canal",
            "zona_origen": "Osona",
            "anio": 2021,
            "formato_capacidad": "750",
            "copa_nombre": "Copa Burdeos"
        },
        {
            "vino_nombre": "Canal Blanco Premium",
            "tipo_nombre": "Blanco",
            "bodega_nombre": "Bodega La Canal",
            "zona_origen": "Penedès",
            "anio": 2022,
            "formato_capacidad": "750",
            "copa_nombre": "Copa Chardonnay"
        }
    ]
    
    # Reemplazamos temporalmente la función real de base de datos por nuestro mock.
    # Como controller.py importa "get_all_vinos" desde database.queries, debemos parchearlo en controller.controller.
    mock_queries = mocker.patch("controller.controller.get_all_vinos", return_value=vinos_simulados)

    # 2. ACT (Ejecutar la acción)
    # Hacemos una petición GET virtual a la API
    response = client.get("/vinos")

    # 3. ASSERT (Comprobar resultados)
    assert response.status_code == 200
    
    # Comprobamos que el JSON recibido coincide con los datos del mock
    json_data = response.get_json()
    assert len(json_data) == 2
    assert json_data[0]["vino_nombre"] == "La Canal Crianza"
    assert json_data[1]["tipo_nombre"] == "Blanco"
    
    # Aseguramos que la función de BBDD fue llamada exactamente 1 vez
    mock_queries.assert_called_once()
