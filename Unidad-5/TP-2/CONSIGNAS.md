# El lenguaje SQL (DLL)

## Guía de TP N° 4 - El lenguaje SQL

### Parte II: Definición de datos

1. Para los siguientes ejercicios, utilice el siguiente esquema de relaciones:

   - **Hotel** (hotelNo, hotelName, city)
   - **Room** (RoomNo, @hotelNo, type, price)
   - **Booking** (@hotelNo, @guestNo, dateFrom, dateTo, @roomNo)
   - **Guest** (guestNo, guestName, guestAddress)

### Instrucciones

- a. Crear la tabla **Hotel** utilizando las características de mejora de la integridad de SQL.
- b. Crear las tablas **Room**, **Booking** y **Guest** utilizando las características de mejora de la integridad de SQL con las siguientes restricciones:
  - I. **type** puede tener los siguientes valores: Single, Double o Family.
  - II. **price** debe estar comprendido entre 10 euros y 100 euros.
  - III. **roomNo** debe estar comprendido entre 1 y 100.
  - IV. **dateFrom** y **dateTo** deben ser mayores que la fecha actual.
  - V. No se puede reservar dos veces una misma habitación.
  - VI. Un mismo huésped no puede tener reservas que se solapen.
- c. Crear una tabla separada con la misma estructura que la tabla **Booking** para almacenar los registros antiguos, **Booking_hist**.
- d. Crear una vista que contenga el nombre del hotel y los nombres de los huéspedes albergados en él.
- e. Crear una vista que contenga la cuenta correspondiente a cada huésped del Grosvenor Hotel.

2. Escribir los comandos SQL para:

- a. Crear una Base de Datos **Noticias_DB**.
- b. Crear tabla **Usuarios**:
  - **Usr**: cadena de caracteres (max 50), clave primaria, no admite nulos.
  - **Psw**: cadena de caracteres (max 50), no admite nulos.
  - **Nombre**: cadena de caracteres (max 150).
  - **DNI**: entero, único, no admite nulos.
- c. Crear tabla **Noticias**:
  - **NroNoticia**: entero, clave primaria, no admite nulos.
  - **Titulo**: cadena de caracteres (max 150), no admite nulos.
  - **Texto**: cadena de caracteres (max 5000), no admite nulos.
  - **FechaArticulo**: fecha, mayor a '01/01/2015', no admite nulos.
  - **UsrCarga**: cadena de caracteres (max 50).
- d. Crear tabla **Secciones**:
  - **IdSeccion**: entero, clave primaria, no admite nulos.
  - **NomSeccion**: cadena de caracteres (max 150), no admite nulos.
  - **Descripcion**: cadena de caracteres (max 150), no admite nulos.
  - **UsrCarga**: cadena de caracteres (max 50), clave foránea (**Usr** de **Usuarios**).
- e. Crear tabla **NoticiasSecciones**:
  - **NroNoticia**: entero, parte de clave primaria, clave foránea (**NroNoticia** de **Noticias**), no admite nulos.
  - **IdSeccion**: entero, parte de clave primaria, clave foránea (**IdSeccion** de **Secciones**), no admite nulos.
  - **UsrCarga**: cadena de caracteres (max 50), clave foránea (**Usr** de **Usuarios**).
- f. Modificar tabla **Noticias**:
  - Agregar campo **FechaCaduda**: fecha.
  - Agregar campo **EscritoPor**: cadena de caracteres (max 100).
  - Agregar campo **Fuente**: cadena de caracteres (max 100).
  - Establecer **UsrCarga** como clave foránea.
  - Agregar campo **FechaActualizacion**: fechahora; valor por defecto ahora().
- g. Modificar tabla **Usuarios**:
  - Agregar campo **Activo**: booleano, no admite nulos.
  - Agregar campo **Apellido**: cadena de caracteres (max 150).
- h. Eliminar tabla **NoticiasSecciones**.
- i. Crear tabla **NoticiasSecciones**:
  - **NroNoticia**: entero, parte de clave primaria, clave foránea (**NroNoticia** de **Noticias**), no admite nulos.
  - **IdSeccion**: entero, parte de clave primaria, clave foránea (**IdSeccion** de **Secciones**), no admite nulos.
  - **Destacada**: booleano.
- j. Crear una vista denominada **Ultimas10noticias** que permita recuperar las últimas diez noticias, ordenadas por **fechaArticulo** descendente, que no hayan caducado, incluyendo las columnas: **Titulo**, **fechaArticulo**, **UsrCarga**.
- k. Modificar la vista anterior, eliminando la columna **UsrCarga** y agregando la columna **NomSección**.
- l. Crear una vista llamada **CantidadNoticiasPorUsr** que devuelva la cantidad de noticias que cargó cada **UsrCarga**.
- m. Eliminar la vista creada en el inciso anterior.

3. Escribir los comandos SQL para:

- a. Crear la Base de Datos **UTN_BD**.
- b. Crear tabla **Alumnos**:
  - **LegajoAlum**: entero, clave primaria, no admite nulos.
  - **NomAlum**: cadena de caracteres (max 50), no admite nulos.
  - **ApellidoAlum**: cadena de caracteres (max 50), no admite nulos.
  - **F_Nacimiento**: fecha.
  - **Localidad**: cadena de caracteres (max 100).
  - **TE**: cadena de caracteres (max 11).
  - **Estado**: cadena de caracteres (max 8), valores posibles ('Activo', 'Egresado', 'Desertor').
- c. Crear tabla **Materias**:
  - **NroMateria**: entero, clave primaria, no admite nulos.
  - **NomMateria**: cadena de caracteres (max 90), no admite nulos.
  - **NomCarrera**: cadena de caracteres (max 100).
- d. Crear tabla **Profesores**:
  - **LegajoProf**: entero, clave primaria, no admite nulos.
  - **NomProf**: cadena de caracteres (max 50), no admite nulos.
  - **ApellidoProf**: cadena de caracteres (max 50), no admite nulos.
  - **Domicilio**: cadena de caracteres (max 50).
  - **Localidad**: cadena de caracteres (max 100).
  - **TE**: cadena de caracteres (max 80).
  - **Titulo**: cadena de caracteres (max 100).
  - **InstitucionEstudio**: cadena de caracteres (max 100).
- e. Crear tabla **ProfesoresMaterias**:
  - **LegajoProf**: entero, parte de clave primaria, clave foránea (**LegajoProf** de **Profesores**), no admite nulos.
  - **NroMateria**: entero, parte de clave primaria, clave foránea (**NroMateria** de **Materias**), no admite nulos.
- f. Crear tabla **AlumnosMaterias**:
  - **LegajoAlum**: entero, parte de clave primaria, no admite nulos.
  - **NroMateria**: entero, parte de clave primaria, no admite nulos.
- g. Crear tabla **Localidades**:
  - **CodLocalidad**: 6 caracteres, clave primaria, no admite nulos.
  - **Localidad**: cadena de caracteres (max 100), no admite nulos.
  - **Provincia**: cadena de caracteres (max 100).
- h. Modificar tabla **Alumnos**:
  - Quitar campo **Localidad**.
  - Agregar campo **CodLocalidad**, 6 caracteres, clave foránea (**CodLocalidad** de **Localidades**).
- i. Modificar tabla **Profesores**:
  - Quitar campo **Localidad**.
  - Agregar campo **CodLocalidad**, 6 caracteres, clave foránea (**CodLocalidad** de **Localidades**).
- j. Crear tabla **Carreras**:
  - **CodCarrerra**: cadena de caracteres (max 8), clave primaria, no admite nulos.
  - **NomCarrera**: cadena de caracteres (max 100).
  - **AniosDuracion**: decimal.
- k. Modificar Tabla **Materias**:
  - Quitar campo **NomCarrera**.
  - Agregar campo **CodCarrerra**: cadena de caracteres (max 8), clave foránea (**CodCarrerra** de **Carreras**).
  - Agregar campo **TipoDuracion**: cadena de caracteres (13), valores: Cuatrimestral, Anual.
- l. Eliminar Tabla **AlumnosMaterias**.
- m. Crear tabla **AlumnosMaterias**:
  - **LegajoAlum**: entero, parte de clave primaria, clave foránea (**LegajoAlum** de **Alumnos**), no admite nulos.
  - **NroMateria**: entero, parte de clave primaria, clave foránea (**NroMateria** de **Materias**), no admite nulos.
  - **AnioCursado**: entero, parte de clave primaria, no admite nulos.
  - **CalifFinal**: decimal.
- n. Crear una vista llamada **MateriasPorProfesor** que devuelva en la primera columna todos los profesores que dictan materias, ordenados alfabéticamente, y a continuación, en una segunda columna, todas las materias de ese profesor, ordenadas alfabéticamente.
- o. Crear una vista, **MateriasPorCarrera**, con una primera columna con la carrera, una segunda columna con el nombre de la materia y una tercera columna con el nombre del profesor que la dicta. Todas las columnas deben estar ordenadas alfabéticamente.
- p. Crear una vista, **MateriasPorProfesorSegúnCarrera**, que muestre la cantidad de materias que dicta cada profesor, agrupados éstos por carreras, ordenando las columnas alfabéticamente.

