### Assess flight frequency and identify high-traffic corridors.
# To assess flight frequency and identify high-traffic corridors, we will:
# 1.Count how often each route (origin → destination) appears — that’s flight frequency.
# 2.Identify routes with the highest number of flights — these are high-traffic corridors.


SELECT 
    f.ORIGIN_AIRPORT_ID,
    f.DEST_AIRPORT_ID,
    a1.CITY_NAME AS ORIGIN_CITY,
    a2.CITY_NAME AS DEST_CITY,
    COUNT(*) AS FLIGHT_COUNT
FROM Flight f
JOIN Airport a1 ON f.ORIGIN_AIRPORT_ID = a1.AIRPORT_ID
JOIN Airport a2 ON f.DEST_AIRPORT_ID = a2.AIRPORT_ID
GROUP BY f.ORIGIN_AIRPORT_ID, f.DEST_AIRPORT_ID
ORDER BY FLIGHT_COUNT DESC;

SELECT 
    f.ORIGIN_AIRPORT_ID,
    f.DEST_AIRPORT_ID,
    a1.CITY_NAME AS ORIGIN_CITY,
    a2.CITY_NAME AS DEST_CITY,
    COUNT(*) AS FLIGHT_COUNT
FROM Flight f
JOIN Airport a1 ON f.ORIGIN_AIRPORT_ID = a1.AIRPORT_ID
JOIN Airport a2 ON f.DEST_AIRPORT_ID = a2.AIRPORT_ID
GROUP BY f.ORIGIN_AIRPORT_ID, f.DEST_AIRPORT_ID
ORDER BY FLIGHT_COUNT DESC
limit 10;

## Los Angels is a part of The top 10 busiest air routes.

select * from flight;
select * from airport;



