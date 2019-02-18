CREATE TABLE teacher (
  id INT AUTO_INCREMENT PRIMARY KEY,
  salutation VARCHAR(15),
  first_name VARCHAR(100),
  middle_name VARCHAR(100),
  last_name VARCHAR(100),
  suffix VARCHAR(15),
  dob DATE,
  address TEXT,
  email VARCHAR(100),
  gender ENUM('Male', 'Female'),
  religion VARCHAR(50),
  phone CHAR(11),
  designation VARCHAR(100),
  photo BLOB,
  date_created DATETIME,
  date_modified DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  created_by INT,
  school_id INT,
  rfid CHAR(10)
);

CREATE TABLE teacher_specialization (
  id INT AUTO_INCREMENT PRIMARY KEY,
  teacher_id INT,
  subject_id INT,
  `PRIMARY KEY` TINYINT,
  school_id INT
);

CREATE TABLE teacher_availability (
  id INT AUTO_INCREMENT PRIMARY KEY,
  teacher_id INT,
  `day` CHAR(15),
  start_time TIME,
  end_time TIME,
  date_created DATETIME,
  date_modified DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  created_by INT,
  school_id INT
);

CREATE TABLE `subject` (
  id INT AUTO_INCREMENT PRIMARY KEY,
  subject_title VARCHAR(150),
  subject_description TEXT,
  subject_code VARCHAR(15),
  is_lab TINYINT DEFAULT 0,
  is_elective TINYINT DEFAULT 0,
  pre_requisite INT DEFAULT 0,
  units DECIMAL(2, 1),
  max_students INT,
  date_created DATETIME,
  date_modified DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  created_by INT,
  school_id INT
);

CREATE TABLE student (
  id INT AUTO_INCREMENT PRIMARY KEY,
  student_no VARCHAR(50),
  salutation VARCHAR(15),
  first_name VARCHAR(100),
  middle_name VARCHAR(100),
  last_name VARCHAR(100),
  suffix VARCHAR(15),
  dob DATE,
  address TEXT,
  email VARCHAR(100),
  gender ENUM('Male', 'Female'),
  religion VARCHAR(50),
  phone CHAR(11),
  photo BLOB,
  date_created DATETIME,
  date_modified DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  created_by INT,
  school_id INT,
  rfid CHAR(10)
);

CREATE TABLE temp_student (
  id INT AUTO_INCREMENT PRIMARY KEY,
  student_no VARCHAR(50),
  salutation VARCHAR(15),
  first_name VARCHAR(100),
  middle_name VARCHAR(100),
  last_name VARCHAR(100),
  suffix VARCHAR(15),
  dob DATE,
  address TEXT,
  email VARCHAR(100),
  gender ENUM('Male', 'Female'),
  religion VARCHAR(50),
  phone CHAR(11),
  photo BLOB,
  date_created DATETIME,
  date_modified DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  created_by INT,
  school_id INT,
  rfid CHAR(10)
);

CREATE TABLE student_guardian (
  student_id INT,
  guardian_id INT,
  date_created DATETIME,
  date_modified DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  created_by INT,
  school_id INT
);

CREATE TABLE student_status (
  id INT AUTO_INCREMENT PRIMARY KEY,
  student_id INT,
  enrolled TINYINT DEFAULT 0,
  course_id INT,
  passed TINYINT DEFAULT 0,
  graduated TINYINT DEFAULT 0,
  school_year_id INT,
  date_created DATETIME,
  date_modified DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  created_by INT,
  school_id INT
);

CREATE TABLE section (
  id INT AUTO_INCREMENT PRIMARY KEY,
  section_code VARCHAR(15),
  section_title VARCHAR(100),
  max_students INT,
  date_created DATETIME,
  date_modified DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  created_by INT,
  school_id INT
);

CREATE TABLE course_section (
  id INT AUTO_INCREMENT PRIMARY KEY,
  school_year_id INT,
  section_id INT,
  course_id INT,
  date_created DATETIME,
  date_modified DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  created_by INT,
  school_id INT
);

CREATE TABLE guardian (
  id INT AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(100),
  gender ENUM("Male", "Female"),
  relationship VARCHAR(50),
  phone CHAR(11),
  email VARCHAR(100),
  photo BLOB,
  address TEXT,
  date_created DATETIME,
  date_modified DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  created_by INT,
  school_id INT
);

CREATE TABLE rooms (
  id INT AUTO_INCREMENT PRIMARY KEY,
  room_code CHAR(15),
  room_description VARCHAR(100),
  is_lab TINYINT DEFAULT 0,
  capacity INT,
  date_created DATETIME,
  date_modified DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  created_by INT,
  school_id INT
);

CREATE TABLE admission (
  id INT AUTO_INCREMENT PRIMARY KEY,
  temp_student_id INT,
  student_id INT DEFAULT 0,
  `status` ENUM("Enrolled", "Pending", "On Process"),
  course_id INT,
  school_year_id INT,
  date_created DATETIME,
  date_modified DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  school_id INT
);

CREATE TABLE course (
  id INT AUTO_INCREMENT PRIMARY KEY,
  department_id INT,
  course_code VARCHAR(15),
  course_title VARCHAR(100),
  course_description TEXT,
  date_created DATETIME,
  date_modified DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  created_by INT,
  school_id INT
);

CREATE TABLE user (
  id INT AUTO_INCREMENT PRIMARY KEY,
  profile_id INT,
  user_type_id INT,
  username VARCHAR(30),
  password VARCHAR(255),
  salt VARCHAR(255),
  status TINYINT DEFAULT 1,
  date_created DATETIME,
  date_modified DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  created_by INT,
  school_id INT
);