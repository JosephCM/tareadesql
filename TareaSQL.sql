USE Colegio;

CREATE TABLE SCHOOL (
    SchoolId INT PRIMARY KEY,
    SchoolName VARCHAR(50) NOT NULL,
	Description VARCHAR(1000),
    Address VARCHAR(50) NOT NULL,
    Phone VARCHAR(50) NOT NULL,
	PostCode VARCHAR(50),
    PostAddress VARCHAR(50)
);
CREATE TABLE Class (
    ClassId INT PRIMARY KEY,
    SchoolId INT NOT NULL,
    ClassName VARCHAR(50) NOT NULL,
    Description VARCHAR(1000),
    FOREIGN KEY (SchoolId) REFERENCES School(SchoolId)
);
CREATE TABLE Course (
    CourseId INT PRIMARY KEY,
    ClassId INT NOT NULL,
    CourseName VARCHAR(50) NOT NULL,
	SchoolId int NOT NULL,
    Description VARCHAR(1000),
    FOREIGN KEY (ClassId) REFERENCES Class(ClassId)
);
CREATE TABLE Student (
    StudentId INT PRIMARY KEY,
    ClassId INT NOT NULL,
    StudentName VARCHAR(100) NOT NULL,
    StudentNumber VARCHAR(20) NOT NULL,
    TotalGrade FLOAT,
    Address VARCHAR(100),
    Phone VARCHAR(20),
    Email VARCHAR(100),
    FOREIGN KEY (ClassId) REFERENCES Class(ClassId)
);
CREATE TABLE Teacher (
    TeacherId INT PRIMARY KEY,
    SchoolId INT NOT NULL,
    TeacherName VARCHAR(50) NOT NULL,
    Description VARCHAR(1000),
    FOREIGN KEY (SchoolId) REFERENCES School(SchoolId)
);
CREATE TABLE Student_Course (
    StudentId INT NOT NULL,
    CourseId INT NOT NULL,
    PRIMARY KEY (StudentId, CourseId),
    FOREIGN KEY (StudentId) REFERENCES Student(StudentId),
    FOREIGN KEY (CourseId) REFERENCES Course(CourseId)
);
CREATE TABLE Teacher_Course (
    TeacherId INT NOT NULL,
    CourseId INT NOT NULL,
    PRIMARY KEY (TeacherId, CourseId),
    FOREIGN KEY (TeacherId) REFERENCES Teacher(TeacherId),
    FOREIGN KEY (CourseId) REFERENCES Course(CourseId)
);
CREATE TABLE Grade (
    GradeId INT PRIMARY KEY,
    StudentId INT NOT NULL,
    CourseId INT NOT NULL,
    Grade FLOAT,
    Comment VARCHAR(1000),
    FOREIGN KEY (StudentId) REFERENCES Student(StudentId),
    FOREIGN KEY (CourseId) REFERENCES Course(CourseId)
);