create database if not exists cinema_db;

use cinema_db;

CREATE TABLE IF NOT EXISTS sala(
	id_sala INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    numeroSala INT UNSIGNED NOT NULL,
    num_asientos INT UNSIGNED NOT NULL,
    disponible BOOL
);

CREATE TABLE IF NOT EXISTS pelicula(
	id_pelicula INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_salaProyeccion INT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    director VARCHAR(50) NOT NULL,
    duracion TIME NOT NULL,
    fechaEstreno DATE NOT NULL,
	sinopsis TINYTEXT NOT NULL,
    horarios DATETIME,
    CONSTRAINT fk_pelicula_sala
		FOREIGN KEY (id_salaProyeccion)
        REFERENCES sala(id_sala)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS boleto(
	id_boleto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_numSala INT NOT NULL,
    id_nomPelicula INT NOT NULL,
    CONSTRAINT fk_sala_boleto
		FOREIGN KEY (id_numSala)
        REFERENCES sala(id_sala)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
	CONSTRAINT fk_pelicula_boleto
		FOREIGN KEY (id_nomPelicula)
        REFERENCES pelicula(id_pelicula)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

INSERT INTO sala (numeroSala, num_asientos, disponible)
	VALUES ('1', '40', TRUE),
			('2', '50', FALSE),
            ('3', '40', FALSE),
            ('4', '30', FALSE),
            ('5', '40', TRUE),
            ('6', '40', TRUE);
            
INSERT INTO pelicula (id_salaProyeccion, nombre, director, duracion, fechaEstreno, sinopsis, horarios)
	VALUES ('1', 'Avatar: El camino del agua', 'James Cameron', '03:12:00', '2022-12-15', 'Ambientada más de una década después de los sucesos que tuvieron lugar en la primera película', '2022-12-15 12:00:00'),
			('1', 'Black Panther: Wakanda Forever', 'Ryan Coogler', '02:41:00', '2022-11-10', 'Secuela del muerto', '2022-12-17 14:00:00');
            
INSERT INTO boleto (id_numSala, id_nomPelicula)
	VALUES ('1', '2'),
			('1', '2'),
            ('1', '2'),
            ('1', '2');

 /*           
SELECT * FROM pelicula;


DELETE FROM pelicula WHERE id_pelicula = 2;
*/