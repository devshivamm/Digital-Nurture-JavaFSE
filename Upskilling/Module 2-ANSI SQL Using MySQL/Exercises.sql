/* EXERCISE 1  USER UPCOMING EVENTS
SELECT
    U.full_name,
    E.title,
    E.city,
    E.start_date
FROM Users U
JOIN Registrations R ON U.user_id = R.user_id
JOIN Events E ON R.event_id = E.event_id
WHERE E.status = 'upcoming'
AND U.city = E.city
ORDER BY E.start_date; */

/* EXERCISE 2 - TOP RATED EVENTS 
SELECT
    E.title,
    AVG(CAST(F.rating AS FLOAT)) AS AvgRating,
    COUNT(*) AS FeedbackCount
FROM Events E
JOIN Feedback F ON E.event_id = F.event_id
GROUP BY E.title
HAVING COUNT(*) >= 10
ORDER BY AvgRating DESC; */

/* Exercise 3 Inactive Users 
SELECT *
FROM Users U
WHERE NOT EXISTS (
    SELECT 1
    FROM Registrations R
    WHERE R.user_id = U.user_id
      AND R.registration_date >= DATEADD(DAY,-90,GETDATE())
); */

/* Exercise 4 Peak Session Hours
SELECT
    E.title,
    COUNT(S.session_id) AS SessionCount
FROM Events E
LEFT JOIN Sessions S
ON E.event_id = S.event_id
AND CAST(S.start_time AS TIME)
BETWEEN '10:00:00' AND '12:00:00'
GROUP BY E.title;  */

/* Exercise 5 Most Active Cities 
SELECT TOP 5
    U.city,
    COUNT(DISTINCT R.user_id) AS TotalRegistrations
FROM Users U
JOIN Registrations R
ON U.user_id = R.user_id
GROUP BY U.city
ORDER BY TotalRegistrations DESC; */

/* Exercise 6 Event Resource Summary
SELECT
    E.title,
    COUNT(CASE WHEN resource_type='pdf' THEN 1 END) AS PDFs,
    COUNT(CASE WHEN resource_type='image' THEN 1 END) AS Images,
    COUNT(CASE WHEN resource_type='link' THEN 1 END) AS Links
FROM Events E
LEFT JOIN Resources R
ON E.event_id = R.event_id
GROUP BY E.title; */

/* Exercise 7: Low Feedback Alerts
SELECT
    U.full_name,
    E.title,
    F.rating,
    F.comments
FROM Feedback F
JOIN Users U
ON F.user_id = U.user_id
JOIN Events E
ON F.event_id = E.event_id
WHERE F.rating < 3;


/* Exercise 8: Sessions per Upcoming Event
SELECT
    E.title,
    COUNT(S.session_id) AS TotalSessions
FROM Events E
LEFT JOIN Sessions S
ON E.event_id = S.event_id
WHERE E.status='upcoming'
GROUP BY E.title; */

/* Exercise 9: Organizer Event Summary
SELECT
    U.full_name,
    E.status,
    COUNT(*) AS EventCount
FROM Users U
JOIN Events E
ON U.user_id = E.organizer_id
GROUP BY U.full_name,E.status; */

/* Exercise 10: Feedback Gap
SELECT
    E.title
FROM Events E
WHERE EXISTS (
    SELECT 1
    FROM Registrations R
    WHERE R.event_id = E.event_id
)
AND NOT EXISTS (
    SELECT 1
    FROM Feedback F
    WHERE F.event_id = E.event_id
);

/* Exercise 11: Daily New User Count
SELECT
    registration_date,
    COUNT(*) AS UserCount
FROM Users
WHERE registration_date >= DATEADD(DAY,-7,GETDATE())
GROUP BY registration_date
ORDER BY registration_date;

/* Exercise 12: Event with Maximum Sessions
SELECT TOP 1 WITH TIES
    E.title,
    COUNT(S.session_id) AS SessionCount
FROM Events E
JOIN Sessions S
ON E.event_id = S.event_id
GROUP BY E.title
ORDER BY SessionCount DESC;
*/

/* Exercise 13: Average Rating per City
SELECT
    E.city,
    AVG(CAST(F.rating AS FLOAT)) AS AverageRating
FROM Events E
JOIN Feedback F
ON E.event_id = F.event_id
GROUP BY E.city;
*/

/* Exercise 14: Most Registered Events
SELECT TOP 3
    E.title,
    COUNT(R.registration_id) AS TotalRegistrations
FROM Events E
JOIN Registrations R
ON E.event_id = R.event_id
GROUP BY E.title
ORDER BY TotalRegistrations DESC;*/

/*Exercise 15: Event Session Time Conflict
SELECT
    S1.event_id,
    S1.title AS Session1,
    S2.title AS Session2
FROM Sessions S1
JOIN Sessions S2
ON S1.event_id = S2.event_id
AND S1.session_id < S2.session_id
AND S1.start_time < S2.end_time
AND S1.end_time > S2.start_time;

/* Exercise 16: Unregistered Active Users
SELECT *
FROM Users U
WHERE U.registration_date >= DATEADD(DAY,-30,GETDATE())
AND NOT EXISTS (
    SELECT 1
    FROM Registrations R
    WHERE R.user_id = U.user_id
);

/*Exercise 17: Multi-Session Speakers
SELECT
    speaker_name,
    COUNT(*) AS SessionCount
FROM Sessions
GROUP BY speaker_name
HAVING COUNT(*) > 1;

/* Exercise 18: Resource Availability Check
SELECT
    E.title
FROM Events E
LEFT JOIN Resources R
ON E.event_id = R.event_id
WHERE R.resource_id IS NULL;

/* Exercise 19: Completed Events with Feedback Summary
SELECT
    E.title,
    COUNT(DISTINCT R.registration_id) AS TotalRegistrations,
    AVG(CAST(F.rating AS FLOAT)) AS AverageRating
FROM Events E
LEFT JOIN Registrations R
ON E.event_id = R.event_id
LEFT JOIN Feedback F
ON E.event_id = F.event_id
WHERE E.status = 'completed'
GROUP BY E.title; */

/* Exercise 20: User Engagement Index
SELECT
    U.full_name,
    COUNT(DISTINCT R.event_id) AS EventsAttended,
    COUNT(DISTINCT F.feedback_id) AS FeedbackSubmitted
FROM Users U
LEFT JOIN Registrations R
ON U.user_id = R.user_id
LEFT JOIN Feedback F
ON U.user_id = F.user_id
GROUP BY U.full_name; */

/* Exercise 21: Top Feedback Providers
SELECT TOP 5
    U.full_name,
    COUNT(F.feedback_id) AS FeedbackCount
FROM Users U
JOIN Feedback F
ON U.user_id = F.user_id
GROUP BY U.full_name
ORDER BY FeedbackCount DESC; */

/*Exercise 22: Duplicate Registrations Check
SELECT
    user_id,
    event_id,
    COUNT(*) AS DuplicateCount
FROM Registrations
GROUP BY user_id,event_id
HAVING COUNT(*) > 1; */

/* Exercise 23: Registration Trends
SELECT
    YEAR(registration_date) AS Year,
    MONTH(registration_date) AS Month,
    COUNT(*) AS RegistrationCount
FROM Registrations
WHERE registration_date >= DATEADD(MONTH,-12,GETDATE())
GROUP BY
    YEAR(registration_date),
    MONTH(registration_date)
ORDER BY Year, Month;*/

/*Exercise 24: Average Session Duration per Event
SELECT
    E.title,
    AVG(DATEDIFF(MINUTE,S.start_time,S.end_time))
        AS AvgDurationMinutes
FROM Events E
JOIN Sessions S
ON E.event_id = S.event_id
GROUP BY E.title;*/

/* Exercise 25: Events Without Sessions
SELECT
    E.title
FROM Events E
LEFT JOIN Sessions S
ON E.event_id = S.event_id
WHERE S.session_id IS NULL;
*/

SELECT * FROM Users;
SELECT * FROM Events;
SELECT * FROM Sessions;
SELECT * FROM Registrations;
SELECT * FROM Feedback;
SELECT * FROM Resources;











