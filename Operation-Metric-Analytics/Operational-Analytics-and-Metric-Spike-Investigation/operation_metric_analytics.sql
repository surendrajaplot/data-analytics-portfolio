-- ====================================================
-- Operational Analytics and Metric Spike Investigation
-- Author: Surendra Kumar
-- Tools: SQL, MySQL Workbench
-- ====================================================

-- ==========================================
-- CASE STUDY 1: JOB DATA ANALYSIS
-- ==========================================

-- 1. Jobs Reviewed Per Hour

SELECT
    DATE(ds) AS review_date,
    HOUR(STR_TO_DATE(ds,'%Y/%m/%d %H:%i:%s')) AS review_hour,
    COUNT(job_id) AS jobs_reviewed
FROM job_data
WHERE ds BETWEEN '2020/11/01' AND '2020/11/30'
GROUP BY review_date, review_hour
ORDER BY review_date, review_hour;

-- ==========================================
-- 2. 7-Day Rolling Throughput
-- ==========================================

WITH daily_events AS (
    SELECT
        DATE(ds) AS day,
        COUNT(*) AS events,
        SUM(time_spent) AS total_time_spent
    FROM job_data
    GROUP BY day
),

throughput AS (
    SELECT
        day,
        events / NULLIF(total_time_spent,0) AS throughput_per_second
    FROM daily_events
),

rolling_avg AS (
    SELECT
        day,
        AVG(throughput_per_second) OVER(
            ORDER BY day
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ) AS rolling_7_day_throughput
    FROM throughput
)

SELECT *
FROM rolling_avg;

-- ==========================================
-- 3. Language Distribution Share
-- ==========================================

WITH recent_data AS (
    SELECT *
    FROM job_data
    WHERE STR_TO_DATE(ds,'%Y/%m/%d')
          >= CURDATE() - INTERVAL 30 DAY
)

SELECT
    language,
    COUNT(*) AS language_count,
    ROUND(
        100.0 * COUNT(*) /
        SUM(COUNT(*)) OVER(),
        2
    ) AS percentage_share
FROM recent_data
GROUP BY language;

-- ==========================================
-- 4. Duplicate Record Detection
-- ==========================================

SELECT
    job_id,
    actor_id,
    event,
    language,
    time_spent,
    org,
    ds,
    COUNT(*) AS duplicate_count
FROM job_data
GROUP BY
    job_id,
    actor_id,
    event,
    language,
    time_spent,
    org,
    ds
HAVING COUNT(*) > 1;

-- ==========================================
-- CASE STUDY 2: METRIC SPIKE INVESTIGATION
-- ==========================================

-- 5. Weekly User Engagement

SELECT
    DATE_FORMAT(event_time,'%Y-%u') AS week,
    COUNT(DISTINCT user_id) AS weekly_active_users
FROM events
GROUP BY week
ORDER BY week;

-- ==========================================
-- 6. User Growth Analysis
-- ==========================================

SELECT
    DATE(created_at) AS signup_date,
    COUNT(*) AS new_users
FROM users
GROUP BY signup_date
ORDER BY signup_date;

-- ==========================================
-- 7. Weekly Retention Analysis
-- ==========================================

WITH signup_week AS (
    SELECT
        user_id,
        YEARWEEK(created_at,1) AS cohort_week
    FROM users
),

activity_week AS (
    SELECT
        user_id,
        YEARWEEK(event_time,1) AS activity_week
    FROM events
    GROUP BY user_id, activity_week
),

retention AS (
    SELECT
        s.cohort_week,
        a.activity_week,
        COUNT(DISTINCT a.user_id) AS retained_users
    FROM signup_week s
    JOIN activity_week a
        ON s.user_id = a.user_id
    GROUP BY
        s.cohort_week,
        a.activity_week
)

SELECT
    cohort_week,
    activity_week,
    retained_users,
    activity_week - cohort_week AS week_number
FROM retention
ORDER BY cohort_week, week_number;

-- ==========================================
-- 8. Weekly Engagement Per Device
-- ==========================================

SELECT
    DATE_FORMAT(event_time,'%Y-%u') AS week,
    device_type,
    COUNT(DISTINCT user_id) AS active_users
FROM events
GROUP BY week, device_type
ORDER BY week;

-- ==========================================
-- 9. Email Engagement Analysis
-- ==========================================

SELECT
    DATE(sent_time) AS date_sent,
    COUNT(*) AS emails_sent,
    SUM(CASE WHEN opened = 1 THEN 1 ELSE 0 END) AS emails_opened,
    SUM(CASE WHEN clicked = 1 THEN 1 ELSE 0 END) AS emails_clicked,
    ROUND(
        100.0 * SUM(opened) / COUNT(*),
        2
    ) AS open_rate,
    ROUND(
        100.0 * SUM(clicked) / COUNT(*),
        2
    ) AS click_rate
FROM email_events
GROUP BY date_sent
ORDER BY date_sent;
