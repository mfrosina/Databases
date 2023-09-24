SET SCHEMA  FN1MI8000006;

/*read-only view*/
CREATE VIEW V_SERIE_SEASON_INFO
AS SELECT SER.SERIE_NAME, SEA.SEASON_NUMBER, SEA.FROM_DATE
FROM SERIES SER, SEASONS SEA
WHERE SER.SERIE_ID = SEA.SERIE_ID;

SELECT *
FROM V_SERIE_SEASON_INFO
WHERE FROM_DATE > '2017-01-01';

/*updatable view*/
CREATE VIEW V_HEROES_ALL
AS
SELECT HERO_NAME,ACTOR_NAME
FROM HEROES
WHERE HERO_NAME LIKE 'J%';

INSERT INTO  V_HEROES_ALL(HERO_NAME, ACTOR_NAME)
VALUES ('Walter White Jr','RJ Mitte');

SELECT * FROM V_HEROES_ALL;

INSERT INTO  V_HEROES_ALL(HERO_NAME, ACTOR_NAME)
VALUES ('Jenna Carie','Jenna Ortega');

SELECT * FROM V_HEROES_ALL;

/*check option view*/
CREATE VIEW V_SEASONS_ALL_WITH_CK
AS
SELECT SERIE_ID, SEASON_NUMBER, NUMBER_OF_EPISODES, FROM_DATE, TO_DATE
FROM SEASONS
WHERE NUMBER_OF_EPISODES > 8
WITH CHECK OPTION;

INSERT INTO V_SEASONS_ALL_WITH_CK(SERIE_ID, SEASON_NUMBER, NUMBER_OF_EPISODES, FROM_DATE, TO_DATE)
VALUES ('S00005','S03',10,'2022-11-13',NULL); --OK

INSERT INTO V_SEASONS_ALL_WITH_CK(SERIE_ID, SEASON_NUMBER, NUMBER_OF_EPISODES, FROM_DATE, TO_DATE)
VALUES ('S00005','S04',7,'2022-11-13',NULL); --NOT OK , EPISODES < 7

SELECT * FROM V_SEASONS_ALL_WITH_CK;