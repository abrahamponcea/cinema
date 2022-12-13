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
	VALUES ('1', 'Avatar: El camino del agua', 'James Cameron', '03:12:00', '2022-12-15', 'Ambientada más de una década después de los sucesos que tuvieron lugar en la primera película', '2022-12-17 12:00:00'),
			('1', 'Avatar: El camino del agua', 'James Cameron', '03:12:00', '2022-12-15', 'Ambientada más de una década después de los sucesos que tuvieron lugar en la primera película', '2022-12-17 15:25:00'),
			('2', 'Black Panther: Wakanda Forever', 'Ryan Coogler', '02:41:00', '2022-11-10', 'Secuela del muerto', '2022-12-17 14:00:00'),
            ('2', 'Black Panther: Wakanda Forever', 'Ryan Coogler', '02:41:00', '2022-11-10', 'Secuela del muerto', '2022-12-17 17:00:00'),
            ('3', 'Cenicienta', 'Cecilie A. Mosli', '01:25:00', '2022-12-1', 'La sufrida cenicienta', '2022-12-17 14:00:00' ),
            ('3', 'Cenicienta', 'Cecilie A. Mosli', '01:25:00', '2022-12-1', 'La sufrida cenicienta', '2022-12-17 13:40:00' ),
            ('4', 'MALEVOLO', 'Milena Cocozza', '01:52:00', '2022-12-7', 'Ay que miedo', '2022-12-17 12:00:00'),
            ('4', 'MALEVOLO', 'Milena Cocozza', '01:52:00', '2022-12-7', 'Ay que miedo', '2022-12-17 15:20:00'),
            ('5', 'Noche sin Paz', 'Tommy Wirkola', '01:51:00', '2022-12-8', 'Santa es muy malo', '2022-12-17 12:00:00'),
            ('5', 'Noche sin Paz', 'Tommy Wirkola', '01:51:00', '2022-12-8', 'Santa es muy malo', '2022-12-17 13:20:00'),
            ('1', 'El poderos victoria', 'Raúl Ramón', '01:59:00', '2022-11-27', 'Chu chu, ahi viene el tren', '2022-12-17 15:50:00'),
            ('1', 'El poderos victoria', 'Raúl Ramón', '01:59:00', '2022-11-27', 'Chu chu, ahi viene el tren', '2022-12-17 18:15:00'),
            ('2', 'Mar de Sangre', 'James Nunn', '01:29:00', '2022-12-13', 'Tiburoncin UH AH HA', '2022-12-17 17:25:00'),
            ('2', 'Mar de Sangre', 'James Nunn', '01:29:00', '2022-12-13', 'Tiburoncin UH AH HA', '2022-12-17 19:15:00'),
            ('3', 'Un Mundo Extraño', 'Don Hall', '01:40:00', '2022-12-11', 'Otro mundo bien tripeado', '2022-12-17 14:00:00'),
            ('3', 'Un Mundo Extraño', 'Don Hall', '01:40:00', '2022-12-11', 'Otro mundo bien tripeado', '2022-12-17 18:00:00'),
            ('4', 'Maremoto', 'John Andreas Andersen', '01:46:00', '2022-12-17', 'El agua es mala', '2022-12-17 15:40:00'),
            ('4', 'Maremoto', 'John Andreas Andersen', '01:46:00', '2022-12-17', 'El agua es mala', '2022-12-17 19:00:00');
            
INSERT INTO boleto (id_numSala, id_nomPelicula)
	VALUES ('1', '2'),
			('1', '2'),
            ('1', '2'),
            ('1', '2');

 /*           
SELECT * FROM pelicula;


DELETE FROM pelicula WHERE id_pelicula = 2;
*/