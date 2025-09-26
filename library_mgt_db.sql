-- Database: library_mgt_db

CREATE DATABASE library_mgt_db;


-- Table structure for table admins

CREATE TABLE admins (
  admin_id int(10) NOT NULL,
  firstname varchar(255) NOT NULL,
  lastname varchar(255) NOT NULL,
  phone_number varchar(25) NOT NULL,
  email varchar(255) NOT NULL,
  username varchar(255) NOT NULL,
  password varchar(255) NOT NULL,
  picture varchar(255) NOT NULL,
  PRIMARY KEY(admin_id)
)


-- Table structure for table borrowers

CREATE TABLE borrowers (
  borrow_id int(10) NOT NULL,
  firstname varchar(255) NOT NULL,
  lastname varchar(255) NOT NULL,
  gender varchar(255) NOT NULL,
  dept_id int(10) NOT NULL,
  level int(10) DEFAULT NULL,
  unique_code varchar(255) NOT NULL,
  users varchar(255) NOT NULL,
  title varchar(255) NOT NULL,
  edition_id int(10) DEFAULT NULL,
  dates date NOT NULL,
  PRIMARY KEY(borrow_id)
)

-- Table structure for table departments

CREATE TABLE departments (
  dept_id int(10) NOT NULL,
  dept_name varchar(255) NOT NULL,
  dept varchar(255) NOT NULL,
  PRIMARY KEY(dept_id)
) 

-- Table structure for table editions

CREATE TABLE editions (
  edition_id int(10) NOT NULL,
  editions varchar(255) DEFAULT NULL,
  PRIMARY KEY(edition_id)
)

-- Table structure for table projects

CREATE TABLE projects (
  project_id int(10) NOT NULL,
  firstname varchar(255) NOT NULL,
  initial varchar(255) NOT NULL,
  lastname varchar(255) NOT NULL,
  dept_id int(10) NOT NULL,
  topic varchar(255) NOT NULL,
  supervisor int(10) NOT NULL,
  content_reader int(10) NOT NULL,
  design_reader int(10) NOT NULL,
  month_year varchar(255) NOT NULL,
  files varchar(255) NOT NULL,
  PRIMARY KEY(project_id)
) 

-- Table structure for table sessions

CREATE TABLE sessions (
  session_id int(10) NOT NULL,
  session_name varchar(255) NOT NULL,
  PRIMARY KEY(session_id)
) 

-- Table structure for table statistics

CREATE TABLE statistics (
  stat_id int(10) NOT NULL,
  textbook int(10) NOT NULL,
  project int(10) NOT NULL,
  downloads int(10) NOT NULL,
  borrows int(10) NOT NULL,
  male int(10) NOT NULL,
  female int(10) NOT NULL,
  session_id int(10) NOT NULL,
  PRIMARY KEY(stat_id)
) 

-- Table structure for table textbooks

CREATE TABLE textbooks (
  book_id int(10) NOT NULL,
  firstname varchar(255) NOT NULL,
  initial varchar(255) NOT NULL,
  lastname varchar(255) NOT NULL,
  dept_id int(255) NOT NULL,
  topic varchar(255) NOT NULL,
  edition_id int(10) NOT NULL,
  publication_year varchar(255) NOT NULL,
  call_number varchar(255) NOT NULL,
  stack varchar(255) NOT NULL,
  files varchar(255) NOT NULL,
  picture varchar(255) NOT NULL,
  PRIMARY KEY(book_id)
) 

-- Table structure for table users

CREATE TABLE users (
  user_id int(10) NOT NULL,
  firstname varchar(255) NOT NULL,
  lastname varchar(255) NOT NULL,
  gender varchar(255) NOT NULL,
  dept_id int(10) NOT NULL,
  level int(10) DEFAULT NULL,
  unique_code varchar(255) NOT NULL,
  user varchar(255) NOT NULL,
  phone_number varchar(255) NOT NULL,
  email varchar(255) NOT NULL,
  password varchar(255) NOT NULL,
  picture varchar(255) DEFAULT NULL,
  register varchar(255) DEFAULT NULL,
  PRIMARY KEY(user_id)
)


-- Constraints for tables


-- Constraints for table borrowers
--
ALTER TABLE borrowers
  ADD CONSTRAINT FK_dept_id FOREIGN KEY (dept_id) REFERENCES departments (dept_id);

--
-- Constraints for table projects
--
ALTER TABLE projects
  ADD CONSTRAINT FK_pro_dept_id FOREIGN KEY (dept_id) REFERENCES departments (dept_id);

--
-- Constraints for table statistics
--
ALTER TABLE statistics
  ADD CONSTRAINT FK_session_id FOREIGN KEY (session_id) REFERENCES sessions (session_id);

--
-- Constraints for table textbooks
--
ALTER TABLE textbooks
  ADD CONSTRAINT textbooks_ibfk_1 FOREIGN KEY (dept_id) REFERENCES departments (dept_id),
  ADD CONSTRAINT textbooks_ibfk_2 FOREIGN KEY (edition_id) REFERENCES editions (edition_id);

--
-- Constraints for table users
--
ALTER TABLE users
  ADD CONSTRAINT FK_user_dept_id FOREIGN KEY (dept_id) REFERENCES departments (dept_id);
