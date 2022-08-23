SELECT cohorts.name, AVG(completed_at - started_at) as avg_assistance_time
FROM cohorts x
JOIN students ON cohorts.id = cohort_id
JOIN assistance_requests ON students.id = student_id
WHERE AVG(completed_at - started_at) > ALL(
  SELECT AVG(completed_at - started_at) as avg_assistance_time
  FROM cohorts y
  JOIN y.students ON cohorts.id = cohort_id
  JOIN y.assistance_requests ON students.id = student_id
  WHERE x.cohorts.name != y.cohorts.name
  GROUP BY cohorts.name)
GROUP BY cohorts.name;