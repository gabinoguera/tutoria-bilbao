# Setup de Entorno en GitHub Codespaces
## Oracle Database + .NET (C#)

Este documento detalla cómo configurar un entorno de desarrollo en GitHub Codespaces que simule el stack tecnológico del cliente (Oracle + .NET), permitiendo realizar la sesión sin necesidad de instalar software localmente.

### 1. Configuración del Dev Container (`devcontainer.json`)

Para que Codespaces levante automáticamente Oracle y .NET, necesitamos configurar el archivo `.devcontainer/devcontainer.json`.

**Pasos:**
1. Crear carpeta `.devcontainer` en la raíz del repositorio.
2. Crear archivo `devcontainer.json` con el siguiente contenido:

```json
{
  "name": "Metro Bilbao - Oracle & .NET",
  "image": "mcr.microsoft.com/devcontainers/dotnet:8.0",
  "features": {
    "ghcr.io/devcontainers/features/docker-in-docker:2": {},
    "ghcr.io/devcontainers/features/oracle-java:1": {},
    "ghcr.io/devcontainers/features/node:1": {}
  },
  "customizations": {
    "vscode": {
      "extensions": [
        "ms-dotnettools.csdevkit",
        "Oracle.oracledevtools",
        "GitHub.copilot",
        "GitHub.copilot-chat",
        "pkief.material-icon-theme",
        "humao.rest-client"
      ]
    }
  },
  "postCreateCommand": "docker-compose up -d"
}
```

### 2. Configuración de Docker Compose (`docker-compose.yml`)

Necesitamos levantar una instancia de Oracle Database Free.

**Pasos:**
1. Crear archivo `docker-compose.yml` en la raíz del repositorio:

```yaml
version: '3.8'
services:
  oracle:
    image: gvenzl/oracle-free:23-slim-faststart
    container_name: oracle-db
    environment:
      ORACLE_PASSWORD: MetroPassword123!
      APP_USER: metro_user
      APP_USER_PASSWORD: MetroUserPassword123!
    ports:
      - "1521:1521"
    volumes:
      - oracle_data:/opt/oracle/oradata

volumes:
  oracle_data:
```

### 3. Verificación del Entorno

Una vez iniciado el Codespace:

1. **Verificar .NET:**
   ```bash
   dotnet --version
   ```
   *Debería mostrar 8.0.x o superior.*

2. **Verificar Oracle:**
   ```bash
   docker ps
   ```
   *Debería mostrar el contenedor `oracle-db` corriendo.*

3. **Conectar a Oracle:**
   - Usar la extensión "Oracle Developer Tools for VS Code" instalada automáticamente.
   - **Connection String:** `localhost:1521/FREEPDB1`
   - **User:** `metro_user`
   - **Password:** `MetroUserPassword123!`

---

## Estructura del Proyecto Demo

Para la clase, crearemos una estructura que simule un proyecto real de Metro Bilbao:

```
/MetroBilbao_Project
  /src
    /Metro.Validation.Service (C# Class Library)
    /Metro.API (ASP.NET Core Web API)
  /database
    /schema
    /packages
    /seeds
  /docs
    (Aquí generaremos la documentación)
```

### Scripts de Inicialización (Seed Data)

Crearemos un script SQL para poblar la base de datos al inicio.

**Archivo:** `database/init_metro_db.sql`

```sql
-- Tabla de Zonas
CREATE TABLE ZONAS (
    ID NUMBER PRIMARY KEY,
    NOMBRE VARCHAR2(50),
    TARIFA_BASE NUMBER(10,2)
);

-- Tabla de Billetes
CREATE TABLE BILLETES (
    ID NUMBER PRIMARY KEY,
    CODIGO_UUID VARCHAR2(100),
    SALDO NUMBER(10,2),
    FECHA_EXPIRACION DATE,
    TIPO VARCHAR2(20) -- 'NORMAL', 'PREMIUM', 'JOVEN'
);

-- Datos de prueba
INSERT INTO ZONAS VALUES (1, 'Zona A - Bilbao', 1.50);
INSERT INTO ZONAS VALUES (2, 'Zona B - Margen Derecha', 1.80);
INSERT INTO ZONAS VALUES (3, 'Zona C - Margen Izquierda', 1.80);

INSERT INTO BILLETES VALUES (1001, 'AABBCC11', 20.00, SYSDATE + 30, 'NORMAL');
INSERT INTO BILLETES VALUES (1002, 'XXYYZZ99', 5.00, SYSDATE - 1, 'JOVEN');

COMMIT;
```

---

## Notas para el Instructor

- **Tiempo de arranque:** La primera vez que levantes el Codespace, Oracle tardará unos 2-3 minutos en estar listo.
- **Persistencia:** Los datos de Oracle se guardan en el volumen `oracle_data`, así que no se pierden si reinicias el contenedor.
- **Simulación VS 2022:** Aunque estemos en VS Code (web), la extensión de C# Dev Kit ofrece el "Solution Explorer" que es muy similar al de Visual Studio 2022. Úsalo para navegar por el proyecto en lugar del explorador de archivos normal para que se sientan más cómodos.
