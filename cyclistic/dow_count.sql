SELECT
count(case when dow=1 then 1 end) as sunday,
count(case when dow=2 then 1 end) as monday,
count(case when dow=3 then 1 end) as tuesday,
count(case when dow=4 then 1 end) as wednesday,
count(case when dow=5 then 1 end) as thursday,
count(case when dow=6 then 1 end) as friday,
count(case when dow=7 then 1 end) as saturday,
member_casual
FROM 
(
    SELECT  
EXTRACT(dayofweek from started_at) as dow,
ride_id, member_casual
FROM `pivotal-sprite-328314.Cyclistic.202004-divvy-tripdata` 
) as dow_table
group by 
member_casual