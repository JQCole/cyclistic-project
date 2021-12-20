SELECT
CONCAT(start_station_name, " to ", end_station_name) as route,
count(member_casual) as num_type,
member_casual
FROM
    `pivotal-sprite-328314.Cyclistic.202007-divvy-tripdata`
WHERE
start_station_name is not null AND 
end_station_name is not null
GROUP BY 
member_casual,
route
ORDER BY num_type desc
