/* Estos son los requisitos de nuestra base de datos de ejemplo:
La Escuela Internacional de Idiomas es una escuela de formación lingüística.
Ofrece clases de idiomas para clientes corporativos, que pueden impartirse en la Escuela o en las oficinas del cliente, según prefieran. 
La Escuela emplea a profesores, cada uno de los cuales puede impartir múltiples cursos.
La Escuela tiene clientes, cada uno de los cuales puede ofrecer múltiples cursos a través de la escuela. 
Los clientes ofrecen cursos a sus empleados, que tienen la opción de participar.
Cada curso es ofrecido por un cliente. 
Cada curso tiene un profesor en todo momento.
Los participantes en los cursos son empleados de las empresas clientes, es decir, trabajan para ellas. 
Cada participante puede ser empleado de una empresa a la vez. 
Los participantes pueden estar inscritos en más de un curso.


see: https://towardsdatascience.com/designing-a-relational-database-and-creating-an-entity-relationship-diagram-89c1c19320b2
*/ 

#############################
#      CREATE THE DB        #
#############################
# doomsday!
#DROP DATABASE IF EXISTS school;
#CREATE DATABASE school;
USE school;

#############################
#      CREATE THE TABLES    #
#############################
-- STEP 1 teacher

CREATE TABLE teacher (
teacher_id INT PRIMARY KEY,
first_name VARCHAR(10) NOT NULL,
last_name VARCHAR(20) NOT NULL,
language_1 VARCHAR(3) NOT NULL,
languaje_2 VARCHAR(3) NOT NULL,
dob DATE,
tax_id INT,
phone_no VARCHAR(20)
);
-- STEP 3: create the tables client, participants, course

CREATE TABLE company (
client_id INT PRIMARY KEY,
client_name VARCHAR (40) NOT NULL,
address VARCHAR (40) NOT NULL,
industry VARCHAR (40)
);

CREATE TABLE participant (
  participant_id INT PRIMARY KEY,
  first_name VARCHAR(40) NOT NULL,
  last_name VARCHAR(40) NOT NULL,
  phone_no VARCHAR(20),
  company INT
);

CREATE TABLE IF NOT EXISTS course (
  course_id INT PRIMARY KEY,
  course_name VARCHAR(40) NOT NULL,
  language VARCHAR(3) NOT NULL,
  level VARCHAR(2),
  course_length_weeks INT,
  start_date DATE,
  in_school BOOLEAN,
  teacher INT,
  company INT
);

###################################
#      CREATE THE RELATIONHIPS    #
###################################


###################################
#      POPULATE THE DATABASE      #
###################################


###################################
#           PLAY AROUND           #
###################################
