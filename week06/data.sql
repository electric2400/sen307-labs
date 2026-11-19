INSERT INTO Course (course_code, course_title, credit_units, description, dept_id) VALUES ('SEN307', 'Database Systems', 3, 
'Relational database design, SQL queries, normalization, transactions and indexing using MySQL.', 
(SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')), ('SEN301', 'Software Architecture', 3, 
'Architectural styles, design patterns, microservices and how to structure large software systems.', 
(SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')), ('COS301', 'Operating Systems', 3, 
'Processes, threads, CPU scheduling, memory management and file systems.', (SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')), 
('COS305', 'Computer Networks', 3, 
'TCP/IP, routing, switching, LAN and WAN design and network protocols.', (SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')), 
('AIN301', 'Introduction to Artificial Intelligence', 3, 
'Intelligent agents, search algorithms, knowledge representation and reasoning.', (SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')), ('AIN305', 'Machine Learning', 3, 
'Supervised and unsupervised learning, neural networks, deep learning and model evaluation.', 
(SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')), ('AIN307', 'Natural Language Processing', 3, 
'Text processing, word embeddings, language models, sentiment analysis and chatbots.', (SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')), ('DTS301', 'Data Visualization and Analytics', 2, 
'Exploratory data analysis, charts, dashboards and telling stories with data.', (SELECT dept_id FROM Department WHERE dept_name = 'Data Science')), 
('DTS305', 'Big Data Technologies', 3, 
'Distributed storage and processing of very large datasets with Hadoop and Spark.', (SELECT dept_id FROM Department WHERE dept_name = 'Data Science')), 
('CYB301', 'Network Security', 3, 
'Firewalls, cryptography, intrusion detection and protecting networks from attacks.', (SELECT dept_id FROM Department WHERE dept_name = 'Cybersecurity'));


INSERT INTO Department (dept_name) VALUES
('Software Engineering'),
('Computer Science'),
('Artificial Intelligence'),
('Data Science'),
('Cybersecurity');

SET SQL_SAFE_UPDATES = 0;

UPDATE Course SET dept_id = (SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')
WHERE course_code LIKE 'SEN%';

UPDATE Course SET dept_id = (SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')
WHERE course_code LIKE 'COS%';

UPDATE Course SET dept_id = (SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')
WHERE course_code LIKE 'AIN%';

UPDATE Course SET dept_id = (SELECT dept_id FROM Department WHERE dept_name = 'Data Science')
WHERE course_code LIKE 'DTS%';

UPDATE Course SET dept_id = (SELECT dept_id FROM Department WHERE dept_name = 'Cybersecurity')
WHERE course_code LIKE 'CYB%';

SET SQL_SAFE_UPDATES = 1;

SELECT dept_id, dept_name FROM Department;

SELECT d.dept_name, COUNT(c.course_id) AS courses
FROM Department d LEFT JOIN Course c ON d.dept_id = c.dept_id
GROUP BY d.dept_name;





INSERT INTO Lecturer (staff_no, full_name, email, dept_id) VALUES
('VUA/ST/101', 'Dr Amaka Okafor', 'a.okafor@vua.edu.ng', 1),
('VUA/ST/102', 'Dr Musa Bello', 'm.bello@vua.edu.ng', 1),
('VUA/ST/103', 'Dr Ngozi Eze', 'n.eze@vua.edu.ng', 2),
('VUA/ST/104', 'Prof Tunde Adeyemi', 't.adeyemi@vua.edu.ng', 2),
('VUA/ST/105', 'Dr Fatima Abubakar', 'f.abubakar@vua.edu.ng', 3),
('VUA/ST/106', 'Dr Chinedu Nwosu', 'c.nwosu@vua.edu.ng', 3),
('VUA/ST/107', 'Dr Yetunde Balogun', 'y.balogun@vua.edu.ng', 4),
('VUA/ST/108', 'Mr Emeka Obi', 'e.obi@vua.edu.ng', 4),
('VUA/ST/109', 'Dr Halima Yusuf', 'h.yusuf@vua.edu.ng', 5),
('VUA/ST/110', 'Mr Segun Afolabi', 's.afolabi@vua.edu.ng', 5);

INSERT INTO Student (matric_no, full_name, gender, date_of_birth, dept_id) VALUES
('12200', 'Alexander Ogbonna', 'M', '2006-06-26', 1),
('12201', 'Ada Obi', 'F', '2005-03-14', 1),
('12202', 'John Musa', 'M', '2004-11-02', 2),
('12203', 'Chioma Nwankwo', 'F', '2006-07-21', 1),
('12204', 'Ibrahim Sani', 'M', '2003-09-05', 1),
('12205', 'Blessing Okoro', 'F', '2005-12-11', 2),
('12206', 'Tobi Adewale', 'M', '2004-04-18', 2),
('12207', 'Zainab Lawal', 'F', '2006-02-27', 3),
('12208', 'Emmanuel Uche', 'M', '2005-08-09', 3),
('12209', 'Funke Ogunleye', 'F', '2003-06-30', 3),
('12210', 'Daniel Etim', 'M', '2007-01-15', 4),
('12211', 'Aisha Mohammed', 'F', '2004-10-23', 4),
('12212', 'Kelechi Anyanwu', 'M', '2006-05-06', 4),
('12213', 'Grace Effiong', 'F', '2005-09-19', 5),
('12214', 'Samuel Ojo', 'M', '2003-12-01', 5),
('12215', 'Hauwa Danjuma', 'F', '2007-03-08', 5),
('12216', 'Victor Ikenna', 'M', '2004-07-12', 1),
('12217', 'Mercy Akpan', 'F', '2006-11-25', 2),
('12218', 'Abdul Garba', 'M', '2005-04-03', 3),
('12219', 'Esther Onyeka', 'F', '2004-02-16', 4);








INSERT INTO Enrolment (student_id, course_id)
SELECT s.student_id, c.course_id
FROM Student s JOIN Course c
WHERE (s.matric_no, c.course_code) IN (
('12200','SEN307'), ('12200','SEN301'), ('12200','AIN305'),
('12201','SEN307'), ('12201','SEN301'),
('12202','SEN307'), ('12202','COS301'), ('12202','COS305'),
('12203','SEN307'), ('12203','SEN301'),
('12204','SEN307'), ('12204','AIN301'),
('12205','SEN307'), ('12205','COS301'),
('12206','SEN307'), ('12206','COS305'),
('12207','SEN307'), ('12207','AIN301'), ('12207','AIN305'),
('12208','AIN301'), ('12208','AIN307'),
('12209','AIN305'), ('12209','AIN307'),
('12210','DTS301'), ('12210','DTS305'),
('12211','DTS301'), ('12211','DTS305'),
('12212','DTS301'), ('12212','AIN305'),
('12213','CYB301'), ('12213','COS305'),
('12214','CYB301'), ('12214','COS305'),
('12215','CYB301'), ('12215','DTS305'),
('12216','SEN301'), ('12216','COS301'), ('12216','CYB301'),
('12217','COS301'), ('12217','COS305')
);

INSERT INTO CourseAllocation (course_id, lecturer_id)
SELECT c.course_id, l.lecturer_id
FROM Course c JOIN Lecturer l
WHERE (c.course_code, l.staff_no) IN (
('SEN307','VUA/ST/101'), ('SEN307','VUA/ST/102'),
('SEN301','VUA/ST/102'),
('COS301','VUA/ST/103'),
('COS305','VUA/ST/104'),
('AIN301','VUA/ST/105'),
('AIN305','VUA/ST/106'),
('AIN307','VUA/ST/105'),
('DTS301','VUA/ST/107'),
('DTS305','VUA/ST/108'),
('CYB301','VUA/ST/109')
);

SELECT 'Departments' AS tbl, COUNT(*) AS total FROM Department
UNION ALL SELECT 'Lecturers', COUNT(*) FROM Lecturer
UNION ALL SELECT 'Students', COUNT(*) FROM Student
UNION ALL SELECT 'Courses', COUNT(*) FROM Course
UNION ALL SELECT 'Enrolments', COUNT(*) FROM Enrolment
UNION ALL SELECT 'Allocations', COUNT(*) FROM CourseAllocation;
