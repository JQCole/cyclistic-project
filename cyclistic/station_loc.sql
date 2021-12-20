with hollup as 
(SELECT  start_station_name, sum(members) as members, sum(casual) as casual, 
sum(amt) as tot, latitude, longitude
FROM `pivotal-sprite-328314.Cyclistic.top_start_station` as main
LEFT JOIN 
 (
     SELECT latitude, longitude, name
     FROM `pivotal-sprite-328314.Cyclistic.Divvy_Stations_2016_Q1Q2`
 ) as latlng
 on main.start_station_name=latlng.name
group by start_station_name, latitude, longitude
order by amt desc)
SELECT distinct 
geomap.start_station_name, latitude, longitude,
start_lat, start_lng
FROM 
Cyclistic.geomap
LEFT JOIN 
(SELECT start_station_name, start_lat, start_lng
FROM `pivotal-sprite-328314.Cyclistic.202012-divvy-tripdata`
group by start_station_name, start_lat, start_lng) as remain
on geomap.start_station_name=remain.start_station_name
WHERE 
geomap.latitude = '#N/A' AND geomap.longitude = '#N/A'
