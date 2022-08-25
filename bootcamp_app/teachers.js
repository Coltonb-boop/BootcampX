`USE STRICT`

const { Pool } = require('pg');

const pool = new Pool({
  user: 'labber',
  password: 'labber',
  host: 'localhost',
  database: 'bootcampx'
});

const input = process.argv.slice(2);
const cohortName = input[0];

const queryString = `
SELECT DISTINCT teachers.name as teachers_name, cohorts.name as cohorts_name
FROM teachers
JOIN assistance_requests ON teachers.id = teacher_id
JOIN students ON student_id = students.id
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.name = $1
ORDER BY teachers.name;
`;

const values = [`${cohortName}`];

pool.query(queryString, values)
.then(res => {
  res.rows.forEach(user => {
    console.log(`${user.cohorts_name}: ${user.teachers_name}`);
  })
})
.catch(err => console.error('query error', err.stack));