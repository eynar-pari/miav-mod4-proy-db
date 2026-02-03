# miav-mod4-proy-db

Base de datos elegida: `Bookstore.bak`.

**Estructura**
- `bookstore/bookstoreDW/` proyecto SSDT del Data Warehouse.
- `bookstore/bookstoreOLTP/` proyecto SSDT del OLTP (incluye `db/schema`).
- `bookstore/bookstoreETL/` proyecto SSIS con paquetes ETL.
- `bookstore/BookStoreBI.slnx` solución principal.

**Publicación (bookstoreDW)**
1. Abrir `bookstore/BookStoreBI.slnx`.
2. Build del proyecto `bookstoreDW`.
3. Publish a una instancia local.
   - Instancia default: usar `.` o `(local)`.
   - Instancia con nombre: `.\SQLEXPRESS` (o la que corresponda).

**ETL (SSIS)**
- Los paquetes usan Windows Authentication.
- Ajustar `Server name` según tu instancia local (`.` recomendado para default).

**Mejoras recientes**
- Reestructuración del OLTP: `bookstoreOLTP.sqlproj` y `db/schema` movidos a `bookstore/bookstoreOLTP/`.
- Post-deploy: se incluye `scripts/PackageConfig.data.sql` (con `DimBook`).
- SPs robustos: `GetLastPackageRowVersion` devuelve 0 si no hay fila y `UpdateLastPackageRowVersion` hace upsert.
- `PackageConfig` ampliada con `LastLoadDate` e `IsActive`.
- `.gitignore` actualizado para evitar artefactos SSDT/SSIS.

**Integrantes**
- Eynar Pari
- Marcelo Garay
- Sheyla Camila Carrillo
- Agustin Acebo Pedraza
