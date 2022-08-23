SELECT teachers.name, students.name, assignments.name, (assistance_requests.completed_at - assistance_requests.started_at) as duration
FROM teachers
JOIN assistance_requests ON teachers.id = teacher_id
JOIN assignments ON assignment_id = assignments.id
JOIN students ON student_id = students.id
ORDER BY duration;