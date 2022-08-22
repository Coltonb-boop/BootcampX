SELECT SUM(duration) as total_duration
FROM students 
JOIN assignment_submissions ON students.id = student_id
WHERE students.name = 'Ibrahim Schimmel';



-- SELECT students.name as student, count(assignment_submissions.*) as total_submissions
-- FROM assignment_submissions
-- JOIN students ON students.id = student_id
-- WHERE students.end_date IS NULL
-- GROUP BY students.name
-- HAVING count(assignment_submissions.*) < 100;