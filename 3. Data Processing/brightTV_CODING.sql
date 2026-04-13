select * 
FROM workspace.default.bright_tv_viewership as V
Left join workspace.default.bright_tv_user_profile as UP 
ON V.UserID0 = UP.UserID;

--count number of users per show on channel 2 in descending order
SELECT Channel2 AS channel, COUNT(DISTINCT V.UserID0) AS num_users
FROM workspace.default.bright_tv_viewership AS V
LEFT JOIN workspace.default.bright_tv_user_profile AS UP
ON V.UserID0 = UP.UserID
GROUP BY Channel2
ORDER BY num_users DESC;


--TOTAL SUM OF ALL DURATION FOR ALL USERS
SELECT V.USERID0, V.CHANNEL2, V.RECORDDATE2, date_format(V.`Duration 2`, 'HH:mm:ss') as `Duration`, V.userid4, UP.*
FROM workspace.default.bright_tv_viewership as V
LEFT JOIN workspace.default.bright_tv_user_profile as UP 
ON V.UserID0 = UP.UserID
LIMIT 10;


--THE TOTAL NUMBER OF CHANNELS WATCHED BY ALL USERS
SELECT COUNT(DISTINCT Channel2) AS total_channels
FROM workspace.default.bright_tv_viewership as V
LEFT JOIN workspace.default.bright_tv_user_profile as UP
ON V.UserID0 = UP.UserID;


--the total number of users
SELECT COUNT(DISTINCT UserID0) AS total_users
FROM workspace.default.bright_tv_viewership as V
LEFT JOIN workspace.default.bright_tv_user_profile as UP
ON V.UserID0 = UP.UserID;


---BIG QUERY FOR FINAL RESULTS

SELECT
    ROW_NUMBER() OVER (ORDER BY V.UserID0, V.RecordDate2) AS session_id,
    V.UserID0 AS subscriber_id,
    V.Channel2 AS channel,
    from_utc_timestamp(V.RecordDate2, 'Africa/Johannesburg') AS session_start_sast,

    date_format(from_utc_timestamp(V.RecordDate2, 'Africa/Johannesburg'), 'yyyy-MM-dd') AS session_date_sast,
    date_format(from_utc_timestamp(V.RecordDate2, 'Africa/Johannesburg'), 'EEEE') AS day_of_week_name,  
    dayofweek(from_utc_timestamp(V.RecordDate2, 'Africa/Johannesburg')) AS day_of_week_number,    
    hour(from_utc_timestamp(V.RecordDate2, 'Africa/Johannesburg')) AS hour_of_day,
    weekofyear(from_utc_timestamp(V.RecordDate2, 'Africa/Johannesburg')) AS week_of_year,
    month(from_utc_timestamp(V.RecordDate2, 'Africa/Johannesburg')) AS month_number,
    date_format(from_utc_timestamp(V.RecordDate2, 'Africa/Johannesburg'), 'MMMM') AS month_name,


    date_format(V.`Duration 2`, 'HH:mm:ss') AS duration_original,
    (CAST(split(date_format(V.`Duration 2`, 'HH:mm:ss'), ':')[0] AS INT) * 60) +
     CAST(split(date_format(V.`Duration 2`, 'HH:mm:ss'), ':')[1] AS INT) +
     (CAST(split(date_format(V.`Duration 2`, 'HH:mm:ss'), ':')[2] AS DOUBLE) / 60.0) AS duration_minutes,

    CASE
        WHEN hour(from_utc_timestamp(V.RecordDate2, 'Africa/Johannesburg')) BETWEEN 0 AND 5 THEN 'Mid_Night'
        WHEN hour(from_utc_timestamp(V.RecordDate2, 'Africa/Johannesburg')) BETWEEN 6 AND 11 THEN 'Morning'
        WHEN hour(from_utc_timestamp(V.RecordDate2, 'Africa/Johannesburg')) BETWEEN 12 AND 17 THEN 'Afternoon'
        WHEN hour(from_utc_timestamp(V.RecordDate2, 'Africa/Johannesburg')) BETWEEN 18 AND 23 THEN 'Evening'
        ELSE 'Unknown'
    END AS Time_Slot,

    COALESCE(UP.Gender, 'Unknown') AS gender,
    COALESCE(UP.Race, 'Unknown') AS race,
    UP.Age,
    CASE
        WHEN UP.Age IS NULL OR UP.Age = 0 THEN 'Unknown'
        WHEN UP.Age < 18 THEN 'Under 18'
        WHEN UP.Age BETWEEN 18 AND 24 THEN '18-24'
        WHEN UP.Age BETWEEN 25 AND 34 THEN '25-34'
        WHEN UP.Age BETWEEN 35 AND 44 THEN '35-44'
        WHEN UP.Age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+'
    END AS age_group,
    COALESCE(UP.Province, 'Unknown') AS province,
    COALESCE(UP.`Social Media Handle`, 'None') AS social_media_handle,

    UP.Name,
    UP.Surname,
    UP.Email

FROM workspace.default.bright_tv_viewership AS V
LEFT JOIN workspace.default.bright_tv_user_profile AS UP
ON V.UserID0 = UP.UserID  

WHERE V.UserID0 IS NOT NULL
  AND V.`Duration 2` IS NOT NULL
  AND date_format(V.`Duration 2`, 'HH:mm:ss') != '00:00:00'  

ORDER BY session_date_sast, hour_of_day, subscriber_id


