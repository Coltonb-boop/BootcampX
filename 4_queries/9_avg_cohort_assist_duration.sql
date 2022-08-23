SELECT AVG(total_duration) as average
FROM (SELECT SUM(completed_at - started_at) as total_duration
        FROM cohorts
        JOIN students ON cohorts.id = cohort_id
        JOIN assistance_requests ON students.id = student_id
    GROUP BY cohorts.name) as total_duration
