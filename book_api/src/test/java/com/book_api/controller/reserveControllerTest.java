package com.book_api.controller;

import com.book_api.dao.booksDAO.bookDAO;
import com.book_api.dao.clientsDAO.clientDAO;
import com.book_api.dao.tablesDAO.tableDAO;
import com.book_api.model.classes.books;
import com.book_api.model.classes.tables;
import com.book_api.model.enums.timeShiftStates;
import com.book_api.model.enums.tableStates;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class reserveControllerTest {

    @InjectMocks
    private reserveController controller; // El controlador real que queremos probar

    // Creamos los mocks de los DAOs que utiliza el controlador
    @Mock
    private bookDAO bookDAO;

    @Mock
    private clientDAO clientDAO;

    @Mock
    private tableDAO tableDAO;

    @BeforeEach
    void setUp() {
        // Inicializa los mocks anotados con @Mock e inyéctalos automáticamente en 'controller'
        MockitoAnnotations.openMocks(this);
    }

    @Test
    @DisplayName("Debe devolver 200 OK y las mesas libres sin especificar comensales (búsqueda general)")
    void testBuscarLibresSinEspecificarSuccess() {
        // 1. ARRANGE (Mesa de capacidad 2 para la búsqueda por defecto de 0 personas)
        List<tables> mesasSimuladas = new ArrayList<>();
        tables mesaUno = new tables();
        mesaUno.setId(1);
        mesaUno.setCapacity(2);
        mesaUno.setState(tableStates.FREE);
        mesaUno.setLocation("Terraza");
        mesasSimuladas.add(mesaUno);

        // Simulamos que al buscar para 0 comensales, el DAO devuelve la mesa
        Mockito.when(tableDAO.getAvaliableTables(0, timeShiftStates.maniana))
               .thenReturn(mesasSimuladas);

        // 2. ACT
        ResponseEntity<?> response = controller.checkReserve();

        // 3. ASSERT
        assertEquals(HttpStatus.OK, response.getStatusCode());
        assertNotNull(response.getBody());
        
        @SuppressWarnings("unchecked")
        List<tables> result = (List<tables>) response.getBody();
        assertEquals(1, result.size());
        assertEquals(2, result.get(0).getCapacity());
        assertEquals("Terraza", result.get(0).getLocation());
    }

    @Test
    @DisplayName("Debe devolver 200 OK y la mesa disponible de 4 personas al buscar mesa para 2 personas")
    void testBuscarLibresConComensalesSuccess() {
        // 1. ARRANGE
        // El usuario busca mesa para 2 personas
        books reservaBusqueda = new books();
        reservaBusqueda.setGuests(2);

        // En el restaurante hay una mesa disponible con capacidad para 4 personas (mock)
        List<tables> mesasSimuladas = new ArrayList<>();
        tables mesaGrande = new tables();
        mesaGrande.setId(2);
        mesaGrande.setCapacity(4); // Mesa de 4 personas
        mesaGrande.setState(tableStates.FREE);
        mesaGrande.setLocation("Interior");
        mesasSimuladas.add(mesaGrande);

        // Simulamos el DAO: al buscar para 2 personas, se nos devuelve la mesa de 4 personas disponible
        Mockito.when(tableDAO.getAvaliableTables(2, timeShiftStates.maniana))
               .thenReturn(mesasSimuladas);

        // 2. ACT (Llamamos al método del controlador que recibe el objeto books de búsqueda)
        ResponseEntity<?> response = controller.checkReserve(reservaBusqueda);

        // 3. ASSERT (Comprobamos que se devuelve la mesa de 4 personas)
        assertEquals(HttpStatus.OK, response.getStatusCode());
        assertNotNull(response.getBody());

        @SuppressWarnings("unchecked")
        List<tables> result = (List<tables>) response.getBody();
        assertEquals(1, result.size());
        assertEquals(2, result.get(0).getId());
        assertEquals(4, result.get(0).getCapacity()); // Confirmamos que la mesa tiene capacidad para 4
        assertEquals("Interior", result.get(0).getLocation());
        assertEquals(tableStates.FREE, result.get(0).getState());
    }

    @Test
    @DisplayName("Debe devolver 404 NOT FOUND cuando no hay mesas disponibles")
    void testBuscarLibresEmpty() {
        // 1. ARRANGE
        Mockito.when(tableDAO.getAvaliableTables(0, timeShiftStates.maniana))
               .thenReturn(new ArrayList<>());

        // 2. ACT
        ResponseEntity<?> response = controller.checkReserve();

        // 3. ASSERT
        assertEquals(HttpStatus.NOT_FOUND, response.getStatusCode());
        assertEquals("No available tables found!", response.getBody());
    }
}
