SELECT 
month,
count(case when member_casual='member' then 1 end) as member_tot,
count(case when member_casual='casual' then 1 end) as casual_tot,
len.member_casual,
avg(len.trip_len) as average_trip_len,
FROM
    (SELECT
        member_casual,
        DATETIME_DIFF(ended_at, started_at, minute) as trip_len, 
        concat(extract (month from started_at), 
        "-", extract(year from started_at)) as month
    FROM
    `pivotal-sprite-328314.Cyclistic.202004-divvy-tripdata`) as len
group by 
member_casual, month