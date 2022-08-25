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
BEGIN;
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
ROLLBACk TO FRSTDELETE;
UPDATE animals SET weight_kg = weight_kg*-1 WHERE weight_kg < 0;
COMMIT;

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, SUM(escape_attempts) AS attempts FROM animals GROUP BY neutered ORDER BY attempts DESC;
SELECT name, MIN(weight_kg) AS min_wight,MAX(weight_kg) AS max_weight FROM animals GROUP BY name;
SELECT name, AVG(escape_attempts) FROM animals WHERE date_of_birth::date >= '1990-01-01' AND date_of_birth::date <= '2000-12-31' GROUP BY name;

-- Write queries (using JOIN)
SELECT name, date_of_birth, weight_kg, full_name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE full_name = 'Melody Pond';
SELECT * FROM animals JOIN species ON animals.species_id = species.id WHERE species.id = 1;
SELECT full_name, name FROM animals RIGHT JOIN owners ON animals.owner_id = owners.id;
SELECT DISTINCT COUNT(*), species.name FROM animals JOIN species ON animals.species_id = species.id WHERE species.id = 1 OR species.id = 2 GROUP BY species_id, species.name;
SELECT full_name, name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE full_name = 'Jennifer Orwell';
SELECT full_name, name, escape_attempts FROM animals JOIN owners ON animals.owner_id = owners.id WHERE escape_attempts = 0 AND full_name = 'Dean Winchester';
SELECT full_name, COUNT(owner_id) AS total FROM animals JOIN owners ON animals.owner_id = owners.id GROUP BY full_name ORDER BY total DESC LIMIT 1;

-- Write queries to answer the following
SELECT animals.name, vets.name, visits.date_of_visit 
FROM animals INNER JOIN visits ON animals.id = visits.animal_id 
INNER JOIN vets ON visits.vetss_id = vets.id 
WHERE visits.vetss_id = 1 
ORDER BY visits.date_of_visit DESC LIMIT 1;

SELECT COUNT(*) FROM animals 
INNER JOIN visits ON animals.id = visits.animal_id 
INNER JOIN vets ON visits.vetss_id = vets.id 
WHERE visits.vetss_id = 3;

SELECT vets.name, species.name FROM vets 
LEFT JOIN specializations ON vets.id = specializations.vet_id 
LEFT JOIN species ON specializations.species_id = species.id;

SELECT animals.name, vets.name, visits.date_of_visit FROM animals 
INNER JOIN visits ON animals.id = visits.animal_id 
INNER JOIN vets ON visits.vetss_id = vets.id 
WHERE visits.vetss_id = 3 
GROUP BY animals.name, vets.name, visits.date_of_visit 
HAVING visits.date_of_visit 
BETWEEN date '2020-04-01' AND date '2020-08-30';

SELECT animals.name, COUNT(vets.id) FROM animals 
INNER JOIN visits ON animals.id = visits.animal_id 
INNER JOIN vets ON visits.vetss_id = vets.id 
GROUP BY animals.name 
ORDER BY COUNT DESC;

SELECT animals.name, vets.name, visits.date_of_visit FROM animals 
INNER JOIN visits ON animals.id = visits.animal_id 
INNER JOIN vets ON visits.vetss_id = vets.id 
WHERE visits.vetss_id = 2 
ORDER BY visits.date_of_visit LIMIT 1;

SELECT *, vets.name, vets.age, vets.date_of_graduation FROM animals 
INNER JOIN visits ON animals.id = visits.animal_id 
INNER JOIN vets ON visits.vetss_id = vets.id 
ORDER BY visits.date_of_visit DESC;

SELECT COUNT(*) FROM animals INNER JOIN visits ON animals.id = visits.animal_id 
INNER JOIN vets ON visits.vetss_id = vets.id 
WHERE vets.id =2;

SELECT species.name, COUNT(*) FROM species
INNER JOIN animals ON species.id = animals.species_id
INNER JOIN visits ON animals.id = visits.animal_id
INNER JOIN vets ON vets.id = visits.vetss_id
WHERE vets.id = 2 
GROUP BY species.name 
ORDER BY count DESC;