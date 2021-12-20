SELECT
count(member_casual),
member_casual
FROM
`pivotal-sprite-328314.Cyclistic.202004-divvy-tripdata` 
group by member_casual