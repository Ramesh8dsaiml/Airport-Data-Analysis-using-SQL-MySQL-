### Compare passenger numbers across origin cities to identify top-performing airports.
## Total Passengers and Total No. of Flights

SELECT 
    a.CITY_NAME AS ORIGIN_CITY,
    SUM(fm.PASSENGERS) AS TOTAL_PASSENGERS,
    COUNT(f.FLIGHT_ID) AS TOTAL_FLIGHTS
FROM Flight f
JOIN Flightmetrics fm ON f.FLIGHT_ID = fm.FLIGHT_ID
JOIN Airport a ON f.ORIGIN_AIRPORT_ID = a.AIRPORT_ID
GROUP BY a.CITY_NAME
ORDER BY Total_Flights DESC;

## Destination City

SELECT 
    a.CITY_NAME AS ORIGIN_CITY,
    SUM(fm.PASSENGERS) AS TOTAL_PASSENGERS,
    COUNT(f.FLIGHT_ID) AS TOTAL_FLIGHTS
FROM Flight f
JOIN Flightmetrics fm ON f.FLIGHT_ID = fm.FLIGHT_ID
JOIN Airport a ON f.Dest_AIRPORT_ID = a.AIRPORT_ID
GROUP BY a.CITY_NAME
ORDER BY Total_Flights DESC;

## Corelation Between Population and Air Traffic.

select * from city;
select * from all_city_pop;

select substring_index(CityName,',',1) as City_Name,State_ABR,
State_NM, Population
from city c
left join all_city_pop as a
on a.city_name = c.Cityname;

update city
set CityName = SUBSTRING_INDEX(cityname,',',1);

SET SQL_Safe_Updates = 0;

select * from city;

create table City_New
(select City_id,substring_index(CityName,',',1) as City_Name,State_ABR,
State_NM, Population
from city c
left join all_city_pop as a
on a.city_name = c.Cityname);

select * from city_new;







