DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

  CREATE TABLE SpotifyClone.plans(
      plan_id INT PRIMARY KEY AUTO_INCREMENT,
      plan VARCHAR(50) NOT NULL
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.users(
      user_id INT AUTO_INCREMENT PRIMARY KEY,
      name VARCHAR(100) NOT NULL,
      plan_id INT NOT NULL,
      FOREIGN KEY (plan_id) REFERENCES SpotifyClone.plans(plan_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.artists(
      artist_id INT PRIMARY KEY AUTO_INCREMENT,
      name VARCHAR(100) NOT NULL
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.albums(
      album_id INT AUTO_INCREMENT PRIMARY KEY,
      album VARCHAR(100) NOT NULL,
      artist_id INT NOT NULL,
      FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artists(artist_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.songs(
      song_id INT AUTO_INCREMENT PRIMARY KEY,
      name VARCHAR(100) NOT NULL,
      album_id INT NOT NULL,
      duration_seconds INT NOT NULL,
      FOREIGN KEY (album_id) REFERENCES SpotifyClone.albums(album_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.reproduction_history(
      user_id INT NOT NULL,
      song_id INT NOT NULL,
      PRIMARY KEY (user_id, song_id),
      FOREIGN KEY (user_id) REFERENCES SpotifyClone.users(user_id),
      FOREIGN KEY (song_id) REFERENCES SpotifyClone.songs(song_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.user_artists(
      user_id INT NOT NULL,
      artist_id INT NOT NULL,
      PRIMARY KEY (user_id, artist_id),
      FOREIGN KEY (user_id) REFERENCES SpotifyClone.users(user_id),
      FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artists(artist_id)
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.plans (plan)
  VALUES
    ('gratuito'),
    ('familiar'),
    ('universitário'),
    ('pessoal');

  INSERT INTO SpotifyClone.users (name, plan_id)
  VALUES
    ('Barbara Liskov', 1),
    ('Robert Cecil Martin', 1),
    ('Ada Lovelace', 2),
    ('Martin Fowler', 2),
    ('Sandi Metz', 2),
    ('Paulo Freire', 2),
    ('Bell Hooks', 3),
    ('Christopher Alexander', 3),
    ('Judith Butler', 4),
    ('Jorge Amado', 4);

  INSERT INTO SpotifyClone.artists (artist_id, name)
  VALUES
    (1, 'Beyoncé'),
    (2, 'Queen'),
    (3, 'Elis Regina'),
    (4, 'Baco Exu do Blues'),
    (5, 'Blind Guardian'),
    (6, 'Nina Simone');

  INSERT INTO SpotifyClone.albums (album, artist_id)
  VALUES
    ('Renaissance', 1),
    ('Jazz', 2),
    ('Hot Space', 2),
    ('Falso Brilhante', 3),
    ('Vento de Maio', 3),
    ('QVVJFA?', 4),
    ('Somewhere Far Beyond', 5),
    ('I Put A Spell On You', 6);

  INSERT INTO SpotifyClone.songs (name, album_id, duration_seconds)
  VALUES
    ('Samba em Paris', 6, 267),
    ('VIRGOS GROOVE', 1, 369),
    ('Feeling Good', 8, 100),
    ('O Medo de Amar é o Medo de Ser Livre', 5, 207),
    ('Como Nossos Pais', 4, 105),
    ('Under Pressure', 3, 152),
    ('BREAK MY SOUL', 1, 279),
    ('Dont Stop Me Now', 2, 203),
    ('The Bards Song', 2, 244),
    ('ALIEN SUPERSTAR', 1, 116);

  INSERT INTO SpotifyClone.reproduction_history (`user_id`, `song_id`)
  VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 3),
    (2, 4),
    (3, 3),
    (3, 2),
    (4, 1),
    (5, 1),
    (5, 6),
    (6, 4),
    (6, 7),
    (7, 8),
    (8, 8),
    (9, 9),
    (10, 10);

  INSERT INTO SpotifyClone.user_artists (user_id, artist_id)
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