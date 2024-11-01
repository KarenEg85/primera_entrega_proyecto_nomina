DROP DATABASE IF EXISTS nomina;
CREATE DATABASE nomina; 
USE nomina;

CREATE TABLE nomEmpleado(
idEpleado INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
Nombre VARCHAR (254) NOT NULL,
ApellidoPaterno VARCHAR (254) NOT NULL,
ApellidoMaterno VARCHAR (254),
FechaNacimiento DATE NOT NULL,
RFC VARCHAR (12) NOT NULL UNIQUE, 
CURP VARCHAR (18) NOT NULL UNIQUE, 
Direccion VARCHAR (254),
FechaIngreso DATE NOT NULL
);

CREATE TABLE nomRazonSocial(

idRazonSocial INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
DesRazonSocial VARCHAR (254),
RFC VARCHAR (12) NOT NULL UNIQUE,
Direccion VARCHAR (254)
);

CREATE TABLE nomPuesto(

idPuesto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
Puesto VARCHAR(254)
);

CREATE TABLE nomAguinaldo(

idAguinaldo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
Descripcion VARCHAR (254),
Dias INT UNIQUE
);

CREATE TABLE nomVacaciones(

idVacaciones INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
Descripcion VARCHAR (254),
Dias INT UNIQUE
);

CREATE TABLE nomRegistroPatronal(
idRegistroPatronal INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
NumeroPatronal VARCHAR (8) UNIQUE,
Descripción VARCHAR (254)
);


CREATE TABLE CatConstanteConcepto(

idConstanteConcepto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
Descripcion VARCHAR (254),
ClaveSAT INT(3)
);

CREATE TABLE CatConstanteNomina(

idConstanteNomina INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
Descripcion VARCHAR (254),
ClaveSAT INT(3)
);

-- TABLAS CON FK


CREATE TABLE nomTipoConcepto( 

idTipoConcepto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
idConstanteConcepto INT,
Descripcion VARCHAR (254)
);

CREATE TABLE nomTipoNomina(

idTipoNomina INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
idConstanteNomina INT,
idRazonSocial INT,
NombreTipoNomina VARCHAR (254)
);

CREATE TABLE nomConceptos(

idConcepto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
idConstanteConcepto INT,
idTipoConcepto INT,
NombreConcepto VARCHAR (10) UNIQUE, 
Descripcion VARCHAR (254),
Parametros VARCHAR (254),
Version VARCHAR (254)
);

CREATE TABLE nomEmpleadoNomina(

idNomina INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
idRazonSocial INT,
idEmpleado INT,
idTipoNomina INT,
idPuesto INT,
idRegistroPatronal INT,
idAguinaldo INT,
idVacaciones INT,
idConcepto INT,
SalarioDiario DECIMAL(7,2),
SalarioDiarioIntegrado DECIMAL(7,2),
SalarioMensual DECIMAL(7,2)
);



-- REFERENCIAS


ALTER TABLE  nomTipoConcepto
	ADD  CONSTRAINT fkConstraint_idConstanteConcepto
		FOREIGN KEY (idConstanteConcepto) REFERENCES CatConstanteConcepto (idConstanteConcepto);
		

ALTER TABLE  nomTipoNomina
	ADD  CONSTRAINT fkConstraint_idConstanteNomina
		FOREIGN KEY (idConstanteNomina) REFERENCES CatConstanteNomina (idConstanteNomina);		
		

ALTER TABLE  nomTipoNomina
	ADD  CONSTRAINT fkConstraint_idRazonSocial
		FOREIGN KEY (idRazonSocial) REFERENCES nomRazonSocial (idRazonSocial);		


ALTER TABLE  nomConceptos
	ADD  CONSTRAINT fkConstraint_idConstanteConcepto
		FOREIGN KEY (idConstanteConcepto) REFERENCES CatConstanteConcepto (idConstanteConcepto);		


ALTER TABLE  nomConceptos
	ADD  CONSTRAINT fkConstraint_idTipoConcepto
		FOREIGN KEY (idTipoConcepto) REFERENCES nomTipoConcepto (idTipoConcepto);			


/*ALTER TABLE  nomEmpleadoNomina
	ADD  CONSTRAINT fkConstraint_idRazonSocial
		FOREIGN KEY (idRazonSocial) REFERENCES nomRazonSocial (idRazonSocial);	*/	


/*ALTER TABLE  nomEmpleadoNomina
	ADD  CONSTRAINT fkConstraint_idEmpleado
		FOREIGN KEY (idEmpleado) REFERENCES nomEmpleado (idEmpleado);	*/	
		
		
ALTER TABLE  nomEmpleadoNomina
	ADD  CONSTRAINT fkConstraint_idTipoNomina
		FOREIGN KEY (idTipoNomina) REFERENCES nomTipoNomina (idTipoNomina);	
		
		
ALTER TABLE  nomEmpleadoNomina
	ADD  CONSTRAINT fkConstraint_idPuesto
		FOREIGN KEY (idPuesto) REFERENCES nomPuesto (idPuesto);	
		
		
ALTER TABLE  nomEmpleadoNomina
	ADD  CONSTRAINT fkConstraint_idRegistroPatronal
		FOREIGN KEY (idRegistroPatronal) REFERENCES nomRegistroPatronal (idRegistroPatronal);	
		
		
ALTER TABLE  nomEmpleadoNomina
	ADD  CONSTRAINT fkConstraint_idAguinaldo
		FOREIGN KEY (idAguinaldo) REFERENCES nomAguinaldo (idAguinaldo);	
		
		
ALTER TABLE  nomEmpleadoNomina
	ADD  CONSTRAINT fkConstraint_idVacaciones
		FOREIGN KEY (idVacaciones) REFERENCES nomVacaciones (idVacaciones);	


ALTER TABLE  nomEmpleadoNomina
	ADD  CONSTRAINT fkConstraint_idConcepto
		FOREIGN KEY (idConcepto) REFERENCES nomConceptos (idConcepto);	