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
  picture varchar(255) NOT NULL
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
  dates date NOT NULL
)

-- Table structure for table departments

CREATE TABLE departments (
  dept_id int(10) NOT NULL,
  dept_name varchar(255) NOT NULL,
  dept varchar(255) NOT NULL
) 

-- Table structure for table editions

CREATE TABLE editions (
  edition_id int(10) NOT NULL,
  editions varchar(255) DEFAULT NULL
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
  files varchar(255) NOT NULL
) 

-- Table structure for table sessions

CREATE TABLE sessions (
  session_id int(10) NOT NULL,
  session_name varchar(255) NOT NULL
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
  session_id int(10) NOT NULL
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
  picture varchar(255) NOT NULL
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
  register varchar(255) DEFAULT NULL
)


--
-- Indexes for table borrowers
--
ALTER TABLE borrowers
  ADD PRIMARY KEY (borrow_id),
  ADD KEY FK_dept_id (dept_id);

--
-- Indexes for table departments
--
ALTER TABLE departments
  ADD PRIMARY KEY (dept_id);

--
-- Indexes for table editions
--
ALTER TABLE editions
  ADD PRIMARY KEY (edition_id);

--
-- Indexes for table projects
--
ALTER TABLE projects
  ADD PRIMARY KEY (project_id),
  ADD KEY FK_pro_dept_id (dept_id);

--
-- Indexes for table sessions
--
ALTER TABLE sessions
  ADD PRIMARY KEY (session_id);

--
-- Indexes for table statistics
--
ALTER TABLE statistics
  ADD PRIMARY KEY (stat_id),
  ADD KEY FK_session_id (session_id);

--
-- Indexes for table textbooks
--
ALTER TABLE textbooks
  ADD PRIMARY KEY (book_id),
  ADD KEY dept_id (dept_id),
  ADD KEY edition_id (edition_id);

--
-- Indexes for table users
--
ALTER TABLE users
  ADD PRIMARY KEY (user_id),
  ADD KEY FK_user_dept_id (dept_id);


--
-- AUTO_INCREMENT for table borrowers
--
ALTER TABLE borrowers
  MODIFY borrow_id int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table departments
--
ALTER TABLE departments
  MODIFY dept_id int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table editions
--
ALTER TABLE editions
  MODIFY edition_id int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table projects
--
ALTER TABLE projects
  MODIFY project_id int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table sessions
--
ALTER TABLE sessions
  MODIFY session_id int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table statistics
--
ALTER TABLE statistics
  MODIFY stat_id int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table textbooks
--
ALTER TABLE textbooks
  MODIFY book_id int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table users
--
ALTER TABLE users
  MODIFY user_id int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
