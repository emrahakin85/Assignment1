#1
SELECT dest, distance FROM flights GROUP BY dest, distance ORDER BY distance DESC LIMIT 1;
# HNL

#2
SELECT engines, MAX(seats) FROM planes GROUP BY engines HAVING MAX(seats);

SELECT tailnum, engines, seats FROM planes WHERE engines = 1 AND seats = 16
OR engines = 2 AND seats = 400
OR engines = 3 AND seats = 379
OR engines = 4 AND seats = 450 GROUP BY engines, tailnum, seats ORDER BY engines;

#3
SELECT COUNT(*) FROM flights;

#4
SELECT carrier, COUNT(*) FROM flights GROUP BY carrier;

#5
SELECT carrier, COUNT(*) AS 'Num_Flight' FROM flights GROUP BY carrier ORDER BY Num_Flight DESC;

#6
SELECT carrier, COUNT(*) AS 'Num_Flight' FROM flights GROUP BY carrier ORDER BY Num_Flight DESC LIMIT 5;

#7
SELECT carrier, COUNT(*) AS 'Num_Flight' FROM flights WHERE distance >= 1000 GROUP BY carrier ORDER BY Num_Flight DESC LIMIT 5;

#8 Show the number of departures with delay longer than 20 minutes in JFK and all origins seperately by month.
SELECT COUNT(*) AS 'JFK_dd', month FROM flights WHERE origin = 'JFK' AND dep_delay > 20 GROUP BY month ORDER BY JFK_dd DESC;

SELECT month, 
	sum(case when origin = 'JFK' AND dep_delay > 20 then 1 else 0 end) as 'JFK Delay Count',
    sum(case when dep_delay > 20 then 1 else 0 end) as 'Overall Delay Count'
    
FROM flights GROUP BY month;