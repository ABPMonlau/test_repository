# Documentación Técnica: book_api (La Canal)

Este documento contiene la especificación y documentación técnica completa de **book_api**, el servicio backend desarrollado en **Spring Boot 3** que gestiona el flujo de reservas de mesas del **Restaurant La Canal** (Tona). 

El sistema utiliza persistencia relacional a través de **Spring JDBC Template** y está diseñado para ejecutarse tanto en local como en contenedores **Docker**.

---

## 1. Arquitectura y Estructura del Código

La aplicación sigue una arquitectura clásica de tres capas (Controlador -> DAO -> Base de Datos) utilizando acceso directo por JDBC para optimizar el rendimiento y el control de las consultas SQL:

```
book_api/
├── Dockerfile                  # Configuración de Docker (Multi-stage build)
├── pom.xml                     # Dependencias de Maven (Spring Boot, MariaDB, Lombok)
└── src/main/java/com/book_api/
    ├── BookApiApplication.java # Clase de entrada principal de Spring Boot
    ├── config/
    │   └── corsConfig.java     # Configuración de CORS (Orígenes cruzados)
    ├── controller/
    │   └── reserveController.java # Controladores HTTP (Endpoints REST)
    ├── dao/                    # Capa de Acceso a Datos (Interfaces y JDBC Impls)
    │   ├── booksDAO/
    │   ├── clientsDAO/
    │   ├── shiftsDAO/
    │   └── tablesDAO/
    └── model/                  # Modelos e Identidades de Datos
        ├── classes/            # Clases POJO (books, clients, tables, shifts)
        ├── enums/              # Enumeradores de estado (bookStates, etc.)
        └── exceptions/         # Excepciones personalizadas
```

---

## 2. Modelos de Datos (Entidades POJO)

A continuación se detallan los 4 modelos de datos principales y su mapeo con la base de datos relacional:

### A. Clientes (`clients.java`)
Representa la información personal de la persona que realiza la reserva.
* **Mapeo Tabla:** `clientes`
* **Campos:**
  - `id` / `clientID` (int): Identificador único del cliente.
  - `name` (String): Nombre completo.
  - `email` (String): Correo electrónico.
  - `phone` (String): Teléfono móvil de contacto.
  - `bookDate` (Date): Fecha de reserva.

### B. Mesas (`tables.java`)
Representa el mobiliario físico del restaurante.
* **Mapeo Tabla:** `mesas`
* **Campos:**
  - `id` / `tableID` (int): Identificador de la mesa.
  - `capacity` (int): Capacidad máxima de comensales.
  - `state` (tableStates): Estado actual (`FREE`, `BOOKED`).
  - `location` (String): Ubicación física (ej. "Interior", "Terraza").

### C. Reservas (`books.java`)
Entidad central que relaciona un cliente con una mesa en un turno determinado.
* **Mapeo Tabla:** `reservas`
* **Campos:**
  - `id` / `bookID` (int): Identificador único de la reserva.
  - `guests` (int): Número de personas confirmadas.
  - `bookDate` (Date): Fecha en la que se disfrutará la reserva (`yyyy-MM-dd`).
  - `creationDate` (Date): Fecha en la que se efectuó la reserva.
  - `hour` (Time): Hora de la reserva (`hh:mm:ss`).
  - `state` (bookStates): Estado del flujo (`Pendiente`, `Confirmada`, `Cancelada`).
  - `client` (clients): Cliente asociado (`ManyToOne` -> `id_cliente`).
  - `table` (tables): Mesa asignada (`ManyToOne` -> `id_mesa`).
  - `shift` (shifts): Turno correspondiente (`ManyToOne` -> `id_turno`).

---

## 3. Especificación de Endpoints REST (API)

Todos los endpoints devuelven y aceptan tipos de contenido en formato `application/json`.

### 1. Registrar Cliente
* **Ruta:** `POST /agregar/cliente`
* **Descripción:** Añade un nuevo cliente a la base de datos para habilitarle la posibilidad de reservar.
* **Cuerpo de la Petición (JSON):**
  ```json
  {
    "id": 101,
    "name": "Miquel Ferrer",
    "email": "miquel.ferrer@example.com",
    "phone": "+34 655 987 654",
    "bookDate": "2026-06-20"
  }
  ```
* **Códigos de Respuesta:**
  - `201 Created`: Cliente creado correctamente. Retorna `"Successfully created"`.
  - `400 Bad Request`: Error en el cuerpo o fallo al insertar en la BBDD.

---

### 2. Consultar Mesas Libres
* **Ruta:** `POST /buscar/libres`
* **Descripción:** Filtra y devuelve la lista de mesas que disponen de capacidad suficiente para albergar un número determinado de personas en el turno correspondiente.
* **Cuerpo de la Petición (JSON):**
  ```json
  {
    "guests": 6
  }
  ```
* **Códigos de Respuesta:**
  - `200 OK`: Array JSON conteniendo la lista de mesas disponibles.
  - `404 Not Found`: Si no hay mesas libres con capacidad suficiente. Retorna `"No available tables found!"`.

---

### 3. Crear una Reserva
* **Ruta:** `POST /reservar`
* **Descripción:** Registra una nueva reserva. Comprueba que el cliente existe, guarda la reserva en estado `Pendiente` y desactiva la mesa asignada cambiándola a estado `BOOKED`.
* **Cuerpo de la Petición (JSON):**
  ```json
  {
    "guests": 4,
    "bookDate": "2026-06-20",
    "creationDate": "2026-05-29",
    "hour": "13:30:00",
    "client": {
      "id": 101
    },
    "table": {
      "id": 5
    },
    "shift": {
      "id": 1
    }
  }
  ```
* **Códigos de Respuesta:**
  - `201 Created`: Reserva creada y mesa bloqueada. Retorna `"Successfully reserved"`.
  - `400 Bad Request`: Datos de reserva inválidos.
  - `404 Not Found`: El cliente especificado en la reserva no existe.

---

### 4. Cancelar Reserva
* **Ruta:** `GET /cancelar/{id}`
* **Descripción:** Elimina la reserva de la base de datos por su ID e inmediatamente vuelve a poner la mesa asociada en estado libre (`FREE`).
* **Parámetro de Ruta:** `{id}` (ID numérico de la reserva).
* **Códigos de Respuesta:**
  - `202 Accepted`: Reserva cancelada con éxito. Retorna `"Successfully Cancelled"`.
  - `400 Bad Request`: La ID de la reserva no existe o se produjo un error al liberar la mesa.

---

## 4. Configuraciones Globales de Entorno

### Configuración de CORS (`corsConfig.java`)
La API tiene habilitado el intercambio de recursos de origen cruzado (CORS) con las siguientes directivas:
* **Origen Permitido:** `http://localhost:3000` (el puerto típico de producción o desarrollo del frontend).
* **Métodos Soportados:** `GET`, `POST`, `PUT`, `DELETE`, `OPTIONS`.
* **Headers:** Todos permitidos (`*`).
* **Credenciales:** Habilitado (`allowCredentials(true)`).

> [!TIP]
> Si el frontend se despliega en un puerto distinto (por ejemplo, el de Vite por defecto, `5173`), se debe actualizar el origen en `corsConfig.java` para evitar bloqueos del navegador.

### Conexión a Base de Datos (`application.properties`)
* **Base de Datos:** MariaDB
* **Puerto del Servidor Interno:** `3306` (Establecido explícitamente vía `server.port = 3306`).
* **Dirección JDBC:** `jdbc:mariadb://172.17.34.40:3306/reservas_lacanal`

---

## 5. Compilación y Despliegue

### Requisitos Previos
* **Java 21 (JDK o JRE)**
* **Maven 3.x** (o uso de `./mvnw` empaquetado)
* **MariaDB / MySQL** activo en el host o red de Docker.

### A. Ejecución en Local (Maven)
Para compilar y arrancar la API localmente sin Docker:

1. Limpiar y empaquetar el proyecto:
   ```bash
   ./mvnw clean package -DskipTests
   ```
2. Arrancar la aplicación de Spring Boot:
   ```bash
   ./mvnw spring-boot:run
   ```
   *La API estará escuchando en `http://localhost:3306` (según `application.properties`).*

### B. Despliegue con Docker (Multietapa)
El proyecto cuenta con un `Dockerfile` optimizado en dos fases:
1. **Fase de Compilación:** Compila el archivo `.jar` utilizando una imagen ligera de Maven 3 con Eclipse Temurin Java 21.
2. **Fase de Ejecución:** Copia únicamente el archivo ejecutable `.jar` a una imagen ultraligera Alpine JRE 21 para minimizar el espacio del contenedor.

#### Comandos para Desplegar:

1. **Construir la imagen de Docker:**
   ```bash
   docker build -t book_api:latest .
   ```
2. **Ejecutar el contenedor:**
   Dado que Spring Boot corre en el puerto interno `3306` pero el Dockerfile expone el `8080`, se recomienda mapear el puerto de la siguiente forma:
   ```bash
   docker run -d --name book_api_container -p 8080:3306 book_api:latest
   ```
   *Esto hará que la API sea accesible externamente a través de `http://localhost:8080`.*
