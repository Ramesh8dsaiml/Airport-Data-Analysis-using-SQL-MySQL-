use flight_analysis;

select * from airport;
Alter table city_new rename city;
select * from city;
select * from city_new;
update airport
set City_Name = SUBSTRING_INDEX(city_name,',',1);

SET SQL_Safe_Updates = 0;

### Analyse the relation between city population and airport traffic. 

## Cities as Origin
 
SELECT 
    c.CITY_NAME,
    c.POPULATION,
    SUM(fm.PASSENGERS) AS TOTAL_PASSENGERS
FROM City c
JOIN Airport a ON a.CITY_NAME = c.CITY_NAME
JOIN Flight f ON f.ORIGIN_AIRPORT_ID = a.AIRPORT_ID
JOIN Flightmetrics fm ON f.FLIGHT_ID = fm.FLIGHT_ID
GROUP BY c.CITY_NAME, c.POPULATION
ORDER BY TOTAL_PASSENGERS DESC;

select * from city;

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


## Cities as Destination
 
SELECT 
    c.CITY_NAME,
    c.POPULATION,
    SUM(fm.PASSENGERS) AS TOTAL_PASSENGERS
FROM City c
JOIN Airport a ON a.CITY_NAME = c.CITY_NAME
JOIN Flight f ON f.Dest_AIRPORT_ID = a.AIRPORT_ID
JOIN Flightmetrics fm ON f.FLIGHT_ID = fm.FLIGHT_ID
GROUP BY c.CITY_NAME, c.POPULATION
ORDER BY TOTAL_PASSENGERS DESC;

SELECT 
    c.CITY_NAME,
    c.POPULATION,
    SUM(fm.PASSENGERS) AS TOTAL_PASSENGERS,
    count(f.flight_id) as Total_Flights,
    round(SUM(fm.PASSENGERS)/c.Population,2) as Pass_Pop_Ratio  
FROM City c
JOIN Airport a ON a.CITY_NAME = c.CITY_NAME
JOIN Flight f ON f.Dest_AIRPORT_ID = a.AIRPORT_ID
JOIN Flightmetrics fm ON f.FLIGHT_ID = fm.FLIGHT_ID
GROUP BY c.CITY_NAME, c.POPULATION
ORDER BY Pass_Pop_Ratio DESC;
