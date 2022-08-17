/*Queries that provide answers to the questions from all projects.*/
SELECT * FROM animals WHERE name LIKE '%mon%';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT name FROM animals WHERE date_of_birth::date >= '2016-01-01' AND date_of_birth::date <= '2019-12-31';
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name <> 'Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;
-- Second project
 ALTER TABLE animals ADD COLUMN species text;
 UPDATE animals SET species = unspecified;
ROLLBACK;
UPDATE animals SET species ='digimon' WHERE name LIKE '%mon%';
UPDATE animals SET species = 'pokemon' WHERE species <> 'digimon';
COMMIT;

BEGIN;
DELETE FROM animals;
ROLLBACK;

DELETE FROM animals WHERE date_of_birth::date > '2022-01-01';
SAVEPOINT FRSTDELETE;
UPDATE animals SET weight_kg = weight_kg*-1;
