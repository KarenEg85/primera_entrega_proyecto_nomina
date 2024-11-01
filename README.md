# PRIMER DER NÓMINA
Primera entrega de proyecto (nómina)
![image](https://github.com/user-attachments/assets/6c39b84e-aa17-46ae-9a6b-8d7931ec1f53)

# DER WORKBENCH
![image](https://github.com/user-attachments/assets/0939d603-7015-44e3-ac0a-c104690692a3)


# NÓMINA Database

La base de datos `nomina` está diseñada para gestionar la información relacionada con datos de nómina de una o varias empresas. Permite guardar la información de los trabajadores tanto personales como de la nómina, cómo por ejemplo, prestaciones de LEY. 

# Explicación ChatGPT

Este código SQL define la estructura de una base de datos llamada nomina, que parece estar orientada a gestionar información relacionada con empleados, conceptos de nómina y otros aspectos laborales. Vamos a desglosar las partes clave del código:

# 1. Crear la Base de Datos
sql
Copiar código
DROP DATABASE IF EXISTS nomina;
CREATE DATABASE nomina; 
USE nomina;
DROP DATABASE IF EXISTS: Elimina la base de datos nomina si ya existe.
CREATE DATABASE: Crea una nueva base de datos llamada nomina.
USE: Selecciona la base de datos nomina para realizar operaciones en ella.

# 2. Crear Tablas
Las siguientes instrucciones crean varias tablas que contienen la información necesaria:

nomEmpleado: Almacena información sobre los empleados, incluyendo su nombre, apellidos, RFC (Registro Federal de Contribuyentes), CURP (Clave Única de Registro de Población) y fecha de nacimiento.

nomRazonSocial: Contiene información sobre la razón social de las empresas, con RFC y dirección.

nomPuesto: Lista los puestos disponibles en la empresa.

nomAguinaldo: Registra descripciones y días asociados al aguinaldo.

nomVacaciones: Similar a la tabla de aguinaldo, pero para vacaciones.

nomRegistroPatronal: Almacena información del registro patronal.

CatConstanteConcepto y CatConstanteNomina: Tablas de constantes que parecen ser categorías o tipos de conceptos y nómina.

nomTipoConcepto y nomTipoNomina: Relacionan los conceptos y tipos de nómina con sus respectivas constantes.

nomConceptos: Define conceptos específicos utilizados en la nómina.

nomEmpleadoNomina: Relaciona a los empleados con su información de nómina, incluyendo salarios y otros datos.

# 3. Definir Claves Foráneas
Al final del script, se definen las relaciones entre las tablas usando claves foráneas (FK), lo que establece vínculos entre los datos de diferentes tablas:

Se asocian columnas de una tabla a la clave primaria de otra tabla, asegurando la integridad referencial. Por ejemplo, en nomTipoConcepto, el campo idConstanteConcepto se relaciona con CatConstanteConcepto, lo que significa que cada tipo de concepto debe estar vinculado a una constante válida.

# 4. Comentarios en el Código
Hay algunos comentarios en el código (por ejemplo, con /* ... */) que indican que ciertas relaciones están comentadas y no se ejecutarán. Esto podría ser para futuras implementaciones o para pruebas.

# Conclusión
En resumen, este script configura una base de datos robusta para gestionar nómina y empleados, definiendo claramente las estructuras de datos y las relaciones entre ellas. Esto facilita la gestión de información relacionada con recursos humanos y finanzas dentro de una organización.





