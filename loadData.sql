SET SCHEMA FN1MI8000006;

INSERT INTO Series (serie_id, serie_name, start_date, number_of_seasons, genre)
VALUES
    ('S00001', 'Game of Thrones', '2011-04-17', 8, 'Fantasy'),
    ('S00002', 'Breaking Bad', '2008-01-20', 5, 'Crime'),
    ('S00003', 'The Crown', '2016-11-04', 5, 'Drama'),
    ('S00004', 'Stranger Things', '2016-07-15', 4, 'Science Fiction'),
    ('S00005', 'Friends', '1994-09-22', 10, 'Comedy');

INSERT INTO Seasons (serie_id, season_number, number_of_episodes, from_date, to_date)
VALUES
    ('S00001', 'S01', 10, '2011-04-17', '2011-06-19'),
    ('S00001', 'S02', 10, '2012-04-01', '2012-06-03'),
    ('S00001', 'S03', 10, '2013-03-31', '2013-06-09'),
    ('S00001', 'S04', 10, '2014-04-06', '2014-06-15'),
    ('S00001', 'S05', 10, '2015-04-12', '2015-06-14'),
    ('S00002', 'S01', 7, '2008-01-20', '2008-03-09'),
    ('S00002', 'S02', 13, '2009-03-08', '2009-05-31'),
    ('S00002', 'S03', 13, '2010-03-21', '2010-06-13'),
    ('S00002', 'S04', 13, '2011-07-17', '2011-10-09'),
    ('S00002', 'S05', 16, '2012-07-15', '2012-09-30'),
    ('S00003', 'S01', 10, '2016-11-04', '2016-11-10'),
    ('S00003', 'S02', 10, '2017-12-08', '2018-12-08'),
    ('S00003', 'S03', 10, '2019-11-17', '2020-11-17'),
    ('S00003', 'S04', 10, '2020-11-15', '2021-11-15'),
    ('S00004', 'S01', 8, '2016-07-15', '2017-07-15'),
    ('S00004', 'S02', 9, '2017-10-27', '2018-10-27'),
    ('S00004', 'S03', 8, '2019-07-04', '2020-07-04'),
    ('S00004', 'S04', 8, '2022-06-30', '2022-10-30'),
    ('S00005', 'S01', 8, '2020-10-23', '2021-11-13'),
    ('S00005', 'S02', 8, '2021-10-22', '2022-11-12');

INSERT INTO Episodes (id, episode_number, season_number, serie_id, duration, date)
VALUES
  ('S01E01', 1, 'S01', 'SER001', '00:25:00', '2022-01-01'),
  ('S01E02', 2, 'S01', 'SER001', '00:25:00', '2022-01-08'),
  ('S01E03', 3, 'S01', 'SER001', '00:25:00', '2022-01-15'),
  ('S02E01', 1, 'S02', 'SER001', '00:30:00', '2022-06-01'),
  ('S02E02', 2, 'S02', 'SER001', '00:30:00', '2022-06-08');

INSERT INTO Heroes (hero_name, actor_name)
VALUES
  ('Walter White', 'Bryan Cranston'),
  ('Jesse Pinkman', 'Aaron Paul'),
  ('Skyler White', 'Anna Gunn'),
  ('Rachel Green', 'Jennifer Aniston'),
  ('Monica Geller', 'Courteney Cox'),
  ('Phoebe Buffay', 'Lisa Kudrow'),
  ('Piper Chapman', 'Taylor Schilling'),
  ('Jon Snow', 'Kit Harington');

INSERT INTO Participates (episode_id, hero_number)
VALUES
  ('S01E01', 1),
  ('S01E01', 2),
  ('S01E01', 3),
  ('S01E02', 1),
  ('S01E02', 4),
  ('S01E03', 1),
  ('S01E03', 2),
  ('S01E03', 5),
  ('S02E01', 1),
  ('S02E02', 5);



