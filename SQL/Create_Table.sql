-- Table animal
CREATE DATABASE IF NOT EXISTS Friends_of_Human;

USE Friends_of_Human;

-- Table animal_classes
CREATE TABLE animal_classes
(
	Id INT AUTO_INCREMENT PRIMARY KEY, 
	Class_name VARCHAR(20)
);


-- Table packed_animals
CREATE TABLE packed_animals
(
	Id INT AUTO_INCREMENT PRIMARY KEY,
    Gen_name VARCHAR (20),
    Class_id INT,
    FOREIGN KEY (Class_id) REFERENCES animal_classes (Id) ON DELETE CASCADE ON UPDATE CASCADE
);


-- Table home_animals    
CREATE TABLE home_animals
(
	Id INT AUTO_INCREMENT PRIMARY KEY,
    Gen_name VARCHAR (20),
    Class_id INT,
    FOREIGN KEY (Class_id) REFERENCES animal_classes (Id) ON DELETE CASCADE ON UPDATE CASCADE
);


-- Table cats
CREATE TABLE cats 
(       
    Id INT AUTO_INCREMENT PRIMARY KEY, 
    Name VARCHAR(20), 
    Birthday DATE,
    Commands VARCHAR(50),
    Gen_id int,
    Foreign KEY (Gen_id) REFERENCES home_animals (Id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Table dogs 
CREATE TABLE dogs 
(       
    Id INT AUTO_INCREMENT PRIMARY KEY, 
    Name VARCHAR(20), 
    Birthday DATE,
    Commands VARCHAR(50),
    Gen_id int,
    Foreign KEY (Gen_id) REFERENCES home_animals (Id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Table hamsters 
CREATE TABLE hamsters 
(       
    Id INT AUTO_INCREMENT PRIMARY KEY, 
    Name VARCHAR(20), 
    Birthday DATE,
    Commands VARCHAR(50),
    Gen_id int,
    Foreign KEY (Gen_id) REFERENCES home_animals (Id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Table camels 
CREATE TABLE camels 
(       
    Id INT AUTO_INCREMENT PRIMARY KEY, 
    Name VARCHAR(20), 
    Birthday DATE,
    Commands VARCHAR(50),
    Gen_id int,
    Foreign KEY (Gen_id) REFERENCES packed_animals (Id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Table horses
CREATE TABLE horses 
(       
    Id INT AUTO_INCREMENT PRIMARY KEY, 
    Name VARCHAR(20), 
    Birthday DATE,
    Commands VARCHAR(50),
    Gen_id int,
    Foreign KEY (Gen_id) REFERENCES packed_animals (Id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Table donkeys
CREATE TABLE donkeys 
(       
    Id INT AUTO_INCREMENT PRIMARY KEY, 
    Name VARCHAR(20), 
    Birthday DATE,
    Commands VARCHAR(50),
    Gen_id int,
    Foreign KEY (Gen_id) REFERENCES packed_animals (Id) ON DELETE CASCADE ON UPDATE CASCADE
);