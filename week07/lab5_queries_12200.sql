use SEN307_12200;

-- Task 1: Students in one department, sorted A-Z

SELECT s.student_id,s.matric_no,s.full_name,s.gender,d.dept_name  
FROM student as s left join department as d on s.dept_id=d.dept_id 
WHERE dept_name = 'Software Engineering'
order by s.full_name asc;

-- Explanation: Retrieves students belonging to the Software Engineering department, displaying their details and sorting their names alphabetically from A to Z.


-- Task 2: Courses with their lecturers (INNER JOIN)

SELECT l.full_name,c.course_code,c.course_title
FROM course as c inner join courseallocation as a on c.course_id=a.course_id
inner join lecturer as l on a.lecturer_id=l.lecturer_id;

-- Explanation: Retrieves course details alongside the names of the lecturers assigned to teach them by joining the course, courseallocation, and lecturer tables. Only matching records are returned.


-- Task 3: Students and their courses (LEFT JOIN)

SELECT s.full_name,c.course_code,c.course_title  
FROM student as s left join enrolment as e on s.student_id=e.student_id
inner join course as c on c.course_id=e.course_id;

-- Explanation: Retrieves students and their enrolled courses by joining the student, enrolment, and course tables. It uses LEFT JOIN to include students from the student table, even if they have no enrolment records.


-- Task 4: Filtering with AND / OR / IN / BETWEEN

SELECT * FROM student
WHERE gender = 'M' AND dept_id IN (11, 8,10) AND date_of_birth BETWEEN '2008-01-01' AND
'2008-12-31' ;

-- Explanation: Retrieves male students whose department IDs are among 11, 8, and 10 and whose dates of birth fall between January 1 and December 31, 2008. It combines AND, IN, and BETWEEN to apply multiple conditions.

-- Task 5: Paginating enrolments with LIMIT and OFFSET

SELECT * FROM enrolment order by enrolment_id limit 10 offset 0;
SELECT * FROM enrolment order by enrolment_id limit 10 offset 10;
SELECT * FROM enrolment order by enrolment_id limit 10 offset 20;
SELECT * FROM enrolment order by enrolment_id limit 10 offset 30;
SELECT * FROM enrolment order by enrolment_id limit 10 offset 40;

-- Explanation: Retrieves enrolment records 10 at a time using LIMIT and OFFSET. ORDER BY ensures records follow a consistent enrolment ID order, while OFFSET skips previously retrieved records to display the next page.

-- Challenge:
SELECT s.full_name,c.course_code,c.course_title  
FROM student as s left join enrolment as e on s.student_id=e.student_id
inner join course as c on c.course_id=e.course_id;
-- Explanation: both are the same no difference




