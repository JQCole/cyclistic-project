SELECT
count(member_casual) as num_round_trips,
member_casual
FROM
    `pivotal-sprite-328314.Cyclistic.202007-divvy-tripdata`
WHERE 
start_station_id = end_station_id
GROUP BY    
member_casual