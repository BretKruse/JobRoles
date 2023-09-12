DROP DATABASE IF EXISTS employees;
CREATE DATABASE employees;
USE employees;
CREATE TABLE department (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(30) UNIQUE NOT NULL
);
CREATE TABLE role (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(30) UNIQUE NOT NULL,
  salary DECIMAL UNSIGNED NOT NULL,
  department_id INT UNSIGNED NOT NULL,
  INDEX dep_ind (department_id),
  CONSTRAINT fk_department FOREIGN KEY (department_id) REFERENCES department(id) ON DELETE CASCADE
);
CREATE TABLE employee (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  role_id INT UNSIGNED NOT NULL,
  INDEX role_ind (role_id),
  CONSTRAINT fk_role FOREIGN KEY (role_id) REFERENCES role(id) ON DELETE CASCADE,
  manager_id INT UNSIGNED,
  INDEX man_ind (manager_id),
  CONSTRAINT fk_manager FOREIGN KEY (manager_id) REFERENCES employee(id) ON DELETE SET NULL
);
use employees;
INSERT INTO department
    (name)
VALUES
    ('Operations'),
    ('Analytics'),
    ('Marketing'),
    ('Executive');
INSERT INTO role
    (title, salary, department_id)
VALUES
    ('Owner', 1000000000, 1),
    ('General Manager', 20000000, 1),
    ('Chairman', 15000000, 2),
    ('CEO', 8000000, 2),
    ('President', 7000000, 3),
    ('Vice President', 3000000, 3),
    ('Manager', 500000, 4),
    ('Assistant Manager', 200000, 4);
INSERT INTO employee
    (first_name, last_name, role_id, manager_id)
VALUES
    ('Chris', 'Griffin', 1, NULL),
    ('Bobby', 'Hill', 2, 1),
    ('Bart', 'Simpson', 3, NULL),
    ('Steve', 'Smith', 4, 3),
    ('Cleveland', 'Brown Jr', 5, NULL),
    ('Eric', 'Cartman', 6, 5),
    ('Riley', 'Freeman', 7, NULL),
    ('Stewie', 'Griffin', 8, 7);