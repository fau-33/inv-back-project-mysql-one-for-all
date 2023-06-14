DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

CREATE TABLE plans_types (
    plans_id INT PRIMARY KEY,
    plans_type VARCHAR(50) NOT NULL,
    plans_value DECIMAL(3, 2)
) ENGINE = InnoDB;

CREATE TABLE users (
    user_id INT PRIMARY KEY,
    user_name VARCHAR(45) NOT NULL,
    user_age INT NOT NULL,
    user_signature_date DATE NOT NULL,
    plans_id INT NOT NULL,
    FOREIGN KEY (plans_id) REFERENCES plans_types (plans_id),
    CHECK (plans_id BETWEEN 1 AND 4)
) ENGINE = InnoDB;

CREATE TABLE artists (
    artist_id INT PRIMARY KEY,
    artist_name VARCHAR(90) NOT NULL 
) ENGINE = InnoDB;

CREATE TABLE albums (
    album_id INT PRIMARY KEY,
    album_name VARCHAR(100) NOT NULL,
    artist_id INT NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES artists (artist_id),
    CHECK (artist_id BETWEEN 1 AND 6)
) ENGINE = InnoDB;

CREATE TABLE songs (
    song_id INT PRIMARY KEY,
    song_name VARCHAR(100) NOT NULL,
    song_duration INT NOT NULL,
    year_release INT,
    album_id INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES albums (album_id),
    CHECK (album_id BETWEEN 1 AND 8)
) ENGINE = InnoDB;

CREATE TABLE listened_history (
    user_id INT NOT NULL,
    song_id INT NOT NULL,
    listened_history_date DATETIME NOT NULL,
    PRIMARY KEY (user_id, song_id),
    FOREIGN KEY (user_id) REFERENCES users (user_id),
    FOREIGN KEY (song_id) REFERENCES songs (song_id)
) ENGINE = InnoDB;

CREATE TABLE following_artists (
    user_id INT,
    artist_id INT,
    PRIMARY KEY (user_id, artist_id),
    FOREIGN KEY (user_id) REFERENCES users (user_id),
    FOREIGN KEY (artist_id) REFERENCES artists (artist_id)
) ENGINE = InnoDB;

INSERT INTO SpotifyClone.plans_types (plans_id, plans_type, plans_value)
VALUES 
	(1, 'gratuito', 0),
  	(2, 'familiar', 7.99),
  	(3, 'universitário', 5.99),
  	(4, 'pessoal', 6.99);

INSERT INTO users (user_id, user_name, user_age, user_signature_date, plans_id)
VALUES
    (1, 'Barbara Liskov', 82, '2021-01-01', 1),
    (2, 'Robert Cecil Martin', 58, '2021-01-01', 1),
    (3, 'Ada Lovelace', 37, '2021-01-01', 2),
    (4, 'Martin Fowler', 46, '2021-01-01', 2),
    (5, 'Sandi Metz', 58, '2021-01-01', 2),
    (6, 'Paulo Freire', 19, '2021-01-01', 3),
    (7, 'Bell Hooks', 26, '2021-01-01', 3),
    (8, 'Christopher Alexander', 85, '2021-01-01', 4),
    (9, 'Judith Butler', 45, '2021-01-01', 4),
    (10, 'Jorge Amado', 58, '2021-01-01', 4);


INSERT INTO SpotifyClone.artists (artist_id, artist_name)
VALUES
	(1, 'Beyoncé'),
  	(2, 'Queen'),
  	(3, 'Elis Regina'),
  	(4, 'Baco Exu do Blues'),
  	(5, 'Blind Guardian'),
  	(6, 'Nina Simone');

INSERT INTO SpotifyClone.albums (album_id, album_name, artist_id)
VALUES
	(1, 'Renaissance', 1),
  	(2, 'Jazz', 2),
  	(3, 'Hot Space', 2),
  	(4, 'Falso Brilhante', 3),
  	(5, 'Vento de Maio', 3),
  	(6, 'QVVJFA?', 4),
  	(7, 'Somewhere Far Beyond', 5),
  	(8, 'I Put A Spell On You', 6);

INSERT INTO SpotifyClone.songs (song_id, song_name, song_duration, year_release, album_id)
VALUES
	(1, 'BREAK MY SOUL', 279, 2022, 1),
  	(2, "VIRGO'S GROOVE", 369, 2022, 1),
  	(3, 'ALIEN SUPERSTAR', 116, 2022, 1),
  	(4, "Don't Stop Me Now", 203, 1978, 2),
  	(5, 'Under Pressure', 152, 1982, 3),
  	(6, 'Como Nossos Pais', 105, 1998, 4),
  	(7, 'O Medo de Amar é o Medo de Ser Livre', 207, 2001, 5),
  	(8, 'Samba em Paris', 267, 2003, 6),
  	(9, "The Bard's Song", 244, 2007, 7),
  	(10, 'Feeling Good', 100, 2012, 8);

INSERT INTO listened_history (user_id, song_id, listened_history_date)
VALUES
    (1, 8, '2022-02-28 10:45:55'),
    (1, 2, '2020-05-02 05:30:35'),
    (1, 10, '2020-03-06 11:22:33'),
    (2, 10, '2022-08-05 08:05:17'),
    (2, 7, '2020-01-02 07:40:33'),
    (3, 10, '2020-11-13 16:55:13'),
    (3, 2, '2020-12-05 18:38:30'),
    (4, 8, '2021-08-15 17:10:10'),
    (5, 8, '2022-01-09 01:44:33'),
    (5, 5, '2020-08-06 15:23:43'),
    (6, 7, '2017-01-24 00:31:17'),
    (6, 1, '2017-10-12 12:35:20'),
    (7, 4, '2011-12-15 22:30:49'),
    (8, 4, '2012-03-17 14:56:41'),
    (9, 9, '2022-02-24 21:14:22'),
    (10, 3, '2015-12-13 08:30:22');


INSERT INTO SpotifyClone.following_artists (user_id, artist_id)
VALUES
	(1, 1),
  	(1, 2),
  	(1, 3),
  	(2, 1),
  	(2, 3),
  	(3, 2),
  	(4, 4),
  	(5, 5),
  	(5, 6),
  	(6, 6),
  	(6, 1),
  	(7, 6),
  	(9, 3),
  	(10, 2);



















	