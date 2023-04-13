-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music
CREATE TABLE producers
(
  id SERIAL PRIMARY KEY,
  Producer_Name TEXT NOT NULL,
  Number_Of_Artists INTEGER CHECK (Number_Of_Artists > 0) DEFAULT 1
);

INSERT INTO producers
  (Producer_name, Number_Of_Artists)
VALUES
  ('Dust Brothers'),
  ('Stephen Lironi'),
  ('Roy Thomas Baker'),
  ('Walter Afanasieff'),
  ('Benjamin Rice'),
  ('Rick Parashar'),
  ('Al Shux'),
  ('Max Martin'),
  ('Cirkut'),
  ('Shellback'),
  ('Benny Blanco'),
  ('The Matrix'),
  ('Darkchild');

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  artists TEXT[] NOT NULL,
  album TEXT NOT NULL,
  producers_id REFERENCES producers
);

INSERT INTO songs
  (title, duration_in_seconds, release_date, artists, album, producers_id)
VALUES
  ('MMMBop', 238, '04-15-1997', '{"Hanson"}', 'Middle of Nowhere'),
  ('Bohemian Rhapsody', 355, '10-31-1975', '{"Queen"}', 'A Night at the Opera'),
  ('One Sweet Day', 282, '11-14-1995', '{"Mariah Cary", "Boyz II Men"}', 'Daydream'),
  ('Shallow', 216, '09-27-2018', '{"Lady Gaga", "Bradley Cooper"}', 'A Star Is Born'),
  ('How You Remind Me', 223, '08-21-2001', '{"Nickelback"}', 'Silver Side Up'),
  ('New York State of Mind', 276, '10-20-2009', '{"Jay Z", "Alicia Keys"}', 'The Blueprint 3'),
  ('Dark Horse', 215, '12-17-2013', '{"Katy Perry", "Juicy J"}', 'Prism'),
  ('Moves Like Jagger', 201, '06-21-2011', '{"Maroon 5", "Christina Aguilera"}', 'Hands All Over'),
  ('Complicated', 244, '05-14-2002', '{"Avril Lavigne"}', 'Let Go'),
  ('Say My Name', 240, '11-07-1999', '{"Destiny''s Child"}', 'The Writing''s on the Wall');
