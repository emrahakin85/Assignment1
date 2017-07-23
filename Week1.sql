# Self exercises

SELECT
name AS 'Remember'
FROM AIRLINES
ORDER BY name DESC
LIMIT 6;

SELECT *
FROM airlines;

SELECT *
FROM flights
LIMIT 50;

select
carrier, tailnum, distance,
distance / (air_time /60) as 'ave_speed'
from flights
order by ave_speed desc
limit 100;

select carrier, air_time, minute
from flights
where not(carrier = 'UA' and minute < 30);

# LAB:

#1
SELECT * FROM planes;
#2
select *, CONCAT(year, '/', month, '/', day) as 'Date'
FROM weather;
#3
SELECT * FROM planes ORDER BY seats DESC;
#4
SELECT * FROM planes WHERE engine = 'Reciprocating';
#5
SELECT * FROM flights LIMIT 5;
#6
SELECT MAX(air_time) as 'Longest Air Time' FROM flights;
#7
SELECT MIN(air_time) as 'Shortest Air Time'FROM flights WHERE carrier = 'DL';
#8
SELECT * FROM airlines;
SELECT * FROM flights WHERE carrier = 'AS' AND year = '2013' AND month = '6' AND day BETWEEN 1 AND 3;
#9
SELECT * FROM airlines;
SELECT carrier, name FROM airlines WHERE name LIKE '%America%';
#10
SELECT COUNT(*) FROM flights WHERE dest = 'MIA';
#11
SELECT month, COUNT(*) FROM flights WHERE dest = 'MIA' AND year = 2013 AND (month = 1 OR month = 7) GROUP BY month;
#12
SELECT * FROM airports;
SELECT AVG(alt) FROM airports;
SELECT FORMAT(AVG(alt),0) FROM airports;

## Aggregation LAB

#1
SELECT * FROM airports ORDER BY NAME;
SELECT AVG(alt) FROM airports WHERE name LIKE '%Kennedy%' OR name LIKE '%Guardia%' OR name LIKE '%Newark Libe%';
# or
SELECT AVG(alt) FROM airports WHERE faa IN ('EWR','LGA','JFK');
#2
SELECT tz, AVG(alt) AS 'ave_alt' FROM airports GROUP BY tz ORDER BY ave_alt DESC ;
#3
SELECT tailnum, COUNT(*) AS 'Count' FROM flights 
WHERE tailnum IN('N125UW','N848MQ','N328AA','N247JB') # AND (dest OR origin NOT IN('LGA', 'JFK', 'EWR'))
GROUP BY tailnum ORDER BY Count DESC;
#4
SELECT * FROM planes WHERE tailnum IN ('N125UW','N848MQ','N328AA','N247JB');

# Write a SELECT statement that shows for all of the flights during the period February 14th to February 17th for each
#of the four planes above: ‘N125UW’,’N848MQ’,’N328AA’,’N247JB’. Your select statement should return the
#following information: tailnum, flight date information, departure delay, arrival delay, 3 digit destination code 

#5
SELECT tailnum, concat(year,'/',month,'/',day) AS 'Date', dep_delay, arr_delay, dest FROM flights
WHERE tailnum IN('N125UW','N848MQ','N328AA','N247JB') AND month = 2 AND day BETWEEN 14 AND 17
ORDER BY tailnum;