create database if not exists cinema_db;

use cinema_db;

CREATE TABLE IF NOT EXISTS pelicula(
	id_pelicula INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_salaProyeccion INT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    director VARCHAR(50) NOT NULL,
    duracion TIME NOT NULL,
    fechaEstreno DATETIME NOT NULL,
	sinopsis TINYTEXT NOT NULL,
    horarios enum('11:00','12:00','13:00','14:00','15:00','16:00','17:00','18:00','19:00','20:00','21:00','22:00'),
    CONSTRAINT fk_pelicula_sala
		FOREIGN KEY (id_salaProyeccion)
        REFERENCES sala(id_sala)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS sala(
	id_sala INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    numeroSala INT UNSIGNED NOT NULL,
    fila enum('A','B','C','D','E','F','G','H','I','J','K','L') NOT NULL,
    asiento INT UNSIGNED NOT NULL
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
