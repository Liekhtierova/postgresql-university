CREATE TABLE fuculties (
    id serial PRIMARY KEY,
    name varchar (256) NOT NULL CHECK (name != '')
);

INSERT INTO fuculties (name) VALUES 
    ('Mathematics'),
    ('Physics'),
    ('Chemistry'),
    ('History');

CREATE TABLE groups (
    id serial PRIMARY KEY,
    fuculty_id int REFERENCES fuculties(id) ON DELETE CASCADE
);

INSERT INTO groups (fuculty_id) VALUES
    (1),(1),(2),(2),(3),(3),(3),(4);

CREATE TABLE disciplines (
    id serial PRIMARY KEY,
    name varchar (128) NOT NULL CHECK (name != ''),
    teacher_name varchar (256) NOT NULL CHECK (name != '')
);

INSERT INTO disciplines (name, teacher_name) VALUES 
    ('Mathematics', 'Fermat'),
    ('Physics', 'Newton'),
    ('Chemistry', 'van ''t Hoff'),
    ('History', 'Woland');

CREATE TABLE students (
    id serial PRIMARY KEY,
    first_name varchar (64) NOT NULL CHECK (first_name != ''),
    last_name varchar (64) NOT NULL CHECK (last_name != ''),
    group_id int REFERENCES groups (id) ON DELETE CASCADE
);

INSERT INTO students (first_name, last_name, group_id) VALUES
    ('Sonia', 'Pool', 1),
    ('Sasha', 'Cat', 3),
    ('Sveta', 'Moon', 1),
    ('Sveta', 'Horse', 4),
    ('Vasia', 'Check', 2);

CREATE TABLE exams (
    student_id int REFERENCES students (id) ON DELETE CASCADE,
    discipline_id int REFERENCES disciplines (id) ON DELETE CASCADE,
    exam_grade int
);

INSERT INTO exams (student_id, discipline_id, exam_grade) VALUES
    (2, 1, 4),
    (1, 2, 5),
    (4, 3, 3),
    (2, 4, 4);