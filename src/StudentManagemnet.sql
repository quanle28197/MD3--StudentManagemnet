CREATE DATABASE StudentManagemnet;
USE StudentManagemnet;
CREATE TABLE Classes(
                        idClasses INT       NOT NULL AUTO_INCREMENT PRIMARY KEY,
                        NameClasses VARCHAR(40)     NOT NULL,
                        language    VARCHAR(40)     NOT NULL,
                        description VARCHAR(40)     NOT NULL
);

CREATE TABLE Address(
    idAddress INT       NOT NULL AUTO_INCREMENT PRIMARY KEY,
    address   VARCHAR(60)   NOT NULL
);

CREATE TABLE Students(
    idStudent int        NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fullName VARCHAR(60) NOT NULL,
    age      INT         NOT NULL,
    phone   VARCHAR(10)        UNIQUE,
    idAddress INT       NOT NULL,
    idClass   INT       NOT NULL,
    FOREIGN KEY (idAddress) REFERENCES Address (idAddress),
    FOREIGN KEY (idClass) REFERENCES Classes (idClasses)
);

CREATE TABLE Course(
    idCourse INT            NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nameCourse VARCHAR(60)  NOT NULL,
    description VARCHAR(60) NOT NULL
);

CREATE TABLE Point(
    idPoint   INT     NOT NULL AUTO_INCREMENT PRIMARY KEY,
    point     FLOAT   DEFAULT 0 CHECK ( point BETWEEN 0  AND 100),
    idCourse INT      NOT NULL,
    idStudent   INT   NOT NULL,
    FOREIGN KEY (idCourse) REFERENCES Course(idCourse),
    FOREIGN KEY (idStudent) REFERENCES Students(idStudent)
);

INSERT INTO Address VALUES (1,'365, Bach Mai, Ha Noi'),
(2,'119 Tran Duy Hung, Cau Giay'),
(3,'So 6 nha Tho, Hoan Kiem'),
(4,'24 Ly Dao Thanh, Hoan Kiem'),
(5,'32 Ba Trieu, Hai Ba Trung');


INSERT INTO Classes VALUES (1,'Lop 1', 'Tieng Viet', 'lop tieu hoc'),
(2,'Lop 2', 'Tieng Anh', 'lop trung hoc'),
(3,'Lop 3', 'Tieng Phap', 'lop pho thong'),
(4,'Lop 4', 'Tieng Nhat', 'lop tieu hoc'),
(5,'Lop 5', 'Tieng Han', 'lop trung hoc');


INSERT INTO Students VALUES (1, 'Le Anh Quan',24, 0328514398, 1,1 ),
(2, 'Nguyen Minh Duc',18, 0328514396, 1,1 ),
(3, 'Le Anh Tu',16, 0328514397, 2,2 ),
(4, 'Nguyen Anh Thu',28, 0328514391, 2,2 ),
(5, 'Le Thuy Kieu',23, 0328514334, 3,3 ),
(6, 'Le Nhat Minh',17, 0328514387, 3,3 ),
(7, 'Trinh Anh Duc',22, 0328514399, 4,4 ),
(8, 'Nguyen Nam Anh',21, 0328514324, 5,5 ),
(9, 'Quach Ngoc Ngoan',20, 0328514377, 5,5 ),
(10, 'Mai Huyen Anh',24, 0328514309, 1,2 ),
(11, 'Mai Duc Trung',18, 0328514333, 2,1 ),
(12, 'Mai Huyen Anh',24, 0328514321, 2,3 );

INSERT INTO Course VALUES (1,'Tieng Anh basic', 'co ban lam luon'),
(2,'Tieng Phap basic', 'co ban lam luon'),
(3,'Tieng Nhat basic', 'khong co gi ca'),
(4,'Tieng Han basic', 'hoc de'),
(5,'Tieng Duc basic', 'ao qua');

INSERT INTO Point VALUES (1, 18,1, 1),
(2, 26,1, 2),
(3, 39,2, 3),
(4, 40,2, 4),
(5, 66,2, 5),
(6, 92,3, 6),
(7, 77,3, 7),
(8, 34,3, 8),
(9, 65,4, 9),
(10, 48,4, 10);

# Tim kiem hoc vien co ho Nguyen
SELECT idStudent,fullName FROM Students WHERE fullName LIKE 'Nguyen%';

# Tim kiem hoc vien co ten Anh
SELECT idStudent,fullName FROM Students WHERE fullName LIKE '%Anh';

# Tim kiem hoc vien co do tuoi tu 15-18
SELECT idStudent, fullName, age FROM Students
WHERE age BETWEEN 15 and 18;

# Tim kiem hoc vien co id la 12 hoac bang 12
SELECT idStudent,fullName FROM Students WHERE idStudent = 12;


#Thong ke so luong hoc vien tai cac lop
SELECT * FROM Students;

#Thong ke so luong hoc vien tai cac tinh



