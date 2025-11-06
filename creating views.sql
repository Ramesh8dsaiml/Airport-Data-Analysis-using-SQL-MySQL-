## creating views
use flight_analysis;
create view pass_pop_des as 
SELECT 
    c.CITY_NAME,
    c.POPULATION,
    SUM(fm.PASSENGERS) AS TOTAL_PASSENGERS,
    round(SUM(fm.PASSENGERS)/c.Population,2) as Pass_Pop_Ratio  
FROM City c
JOIN Airport a ON a.CITY_NAME = c.CITY_NAME
JOIN Flight f ON f.ORIGIN_AIRPORT_ID = a.AIRPORT_ID
JOIN Flightmetrics fm ON f.FLIGHT_ID = fm.FLIGHT_ID
GROUP BY c.CITY_NAME, c.POPULATION
ORDER BY Pass_Pop_ratio DESC;

select * from pass_pop_des;
select * from city;
SELECT c.CITY_NAME, a.AIRPORT_ID
FROM City c
LEFT JOIN Airport a ON a.CITY_NAME = c.CITY_NAME
WHERE a.AIRPORT_ID IS NULL;

select  * from  pass_pop_des;
select * from city;

SHOW COLUMNS FROM City;
SHOW COLUMNS FROM airport;
SHOW COLUMNS FROM airline;
SHOW COLUMNS FROM flight;

# stored peroducers 
delimiter //

DROP PROCEDURE IF EXISTS state_lavel_taffic;
create procedure traffic()
begin
SELECT 
    a.CITY_NAME AS ORIGIN_CITY,
    SUM(fm.PASSENGERS) AS TOTAL_PASSENGERS,
    COUNT(f.FLIGHT_ID) AS TOTAL_FLIGHTS
FROM Flight f
JOIN Flightmetrics fm ON f.FLIGHT_ID = fm.FLIGHT_ID
JOIN Airport a ON f.Dest_AIRPORT_ID = a.AIRPORT_ID
GROUP BY a.CITY_NAME
ORDER BY Total_Flights DESC;
end//

create  procedure  state_lavel_traffic(in state varchar(50))
begin 
SELECT 
    a.CITY_NAME AS ORIGIN_CITY,
    SUM(fm.PASSENGERS) AS TOTAL_PASSENGERS,
    COUNT(f.FLIGHT_ID) AS TOTAL_FLIGHTS
FROM Flight f
JOIN Flightmetrics fm ON f.FLIGHT_ID = fm.FLIGHT_ID
JOIN Airport a ON f.Dest_AIRPORT_ID = a.AIRPORT_ID
where a.state_nm = state
GROUP BY a.CITY_NAME
ORDER BY Total_Flights DESC;
end//
delimiter ;

call state_lavel_traffic("Alaska");

delimiter //
create  procedure   sp_top_routes_by_passenger(in  threshold int)
begin 
SELECT 
    a1.CITY_NAME AS ORIGIN_CITY,
	a2.CITY_NAME AS dest_CITY,    
    SUM(fm.PASSENGERS) AS TOTAL_PASSENGERS
FROM Flight f
JOIN Flightmetrics fm ON f.FLIGHT_ID = fm.FLIGHT_ID
JOIN Airport a1	 ON f.origin_AIRPORT_ID = a1.AIRPORT_ID
join  airport a2 on f.dest_airport_id =a2.airport_id
GROUP BY a1.CITY_NAME , a2.city_name
having total_passengers > threshold
ORDER BY Total_passengers DESC;
end//
delimiter ;
-- drop procedure sp_top_routes_by_passenger;

call sp_top_routes_by_passenger(100000);

select * from  airport;

select state_nm  from airport;

 

