SELECT
*,
FROM 
(
    SELECT  
EXTRACT(dayofweek from started_at) as dow,
concat(extract(year from started_at),"_",
extract(month from started_at)) as year_month,
 member_casual
FROM `pivotal-sprite-328314.Cyclistic.202005-divvy-tripdata`
WHERE 
started_at is not null AND ended_at is not null 
) as dow_table
pivot(count(dow)
 for dow in (1 as sunday,2 as monday,
3 as tuesday,4 as wednesday,5 as thursday,6 as friday,7 as saturday))
group by 
member_casual,1,2,3,4,5,6,7,8,9