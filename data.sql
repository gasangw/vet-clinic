/* Populate database with sample data. */

INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES(1, 'Agumon', '2020-02-03', 0, true, 10.23);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES(2, 'Gabumon', '2018-11-15', 2, true, 8);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES(3, 'Pikachu', '2021-01-07', 1, false, 15.04);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES(4, 'Devimon', '2017-05-12', 5, true, 11);

INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Charmander', '2020-02-08', 0, false, -11);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Plantmon', '2021-11-15', 2, true, -5.7);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Squirtle', '1993-04-02', 3, false, -12.13);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Angemon', '2005-06-12', 1, true, -45);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Boarmon', '2005-06-07', 7, true, 20.4);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Blossom', '1998-10-13', 3,true, 17);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Ditto', '2022-05-14', 4, true, 22);

-- Insert the following data into the owners table
INSERT INTO owners (full_name, age) VALUES('Sam Smith', 34);
INSERT INTO owners (full_name, age) VALUES('Jennifer Orwell', 19);
INSERT INTO owners (full_name, age) VALUES('Bob', 45);
INSERT INTO owners (full_name, age) VALUES('Melody Pond', 77);
INSERT INTO owners (full_name, age) VALUES('Dean Winchester', 14);
INSERT INTO owners (full_name, age) VALUES('Jodie Whittaker', 38);

-- Insert the following data into the species table
INSERT INTO species (name) VALUES('Pokemon');
INSERT INTO species (name) VALUES('Digimon');


-- Modify your inserted animals so it includes the species_id value
UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 1 WHERE name NOT LIKE '%mon';

-- Modify your inserted animals to include owner information (owner_id)
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith') WHERE name = 'Agumon';
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell') WHERE name IN ('Gabumon', 'Pikachu');
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob') WHERE name ='Devimon' OR name = 'Plantmon';
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond') WHERE name IN ('Charmander', 'Squirtle', 'Blossom');
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester') WHERE name IN ('Angemon', 'Boarmon');

-- insert into vets
INSERT INTO vets (name, age, date_of_graduation) VALUES('Vet William Tatcher', 45, '2000-04-23');
INSERT INTO vets (name, age, date_of_graduation) VALUES('Vet Maisy Smith', 26, '2019-01-17');
INSERT INTO vets (name, age, date_of_graduation) VALUES('Vet Stephanie Mendez', 64, '1981-05-04');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Vet Jack Harkness', 38, '2008-06-08');

-- insert data into specializations table;
INSERT INTO specializations(species_id, vet_id) VALUES(1,1);
INSERT INTO specializations(species_id, vet_id) VALUES(1,3);
INSERT INTO specializations(species_id, vet_id) VALUES(2,3);
INSERT INTO specializations(species_id, vet_id) VALUES(2,4);

-- Insert the following data for visits:
INSERT INTO visits(animal_id, vetss_id, date_of_visit) VALUES(12, 1, '2020-05-24');
INSERT INTO visits(animal_id, vetss_id, date_of_visit) VALUES(12, 3, '2020-07-22');
INSERT INTO visits(animal_id, vetss_id, date_of_visit) VALUES(13, 4, '2021-02-02');
INSERT INTO visits(animal_id, vetss_id, date_of_visit) VALUES(14, 2, '2020-03-08');
INSERT INTO visits(animal_id, vetss_id, date_of_visit) VALUES(14, 2, '2020-01-05');
INSERT INTO visits(animal_id, vetss_id, date_of_visit) VALUES(14, 2, '2020-05-14');
INSERT INTO visits(animal_id, vetss_id, date_of_visit) VALUES (15, 3, '2021-05-04')
INSERT INTO visits(animal_id, vetss_id, date_of_visit) VALUES (16, 4, '2021-02-24');
INSERT INTO visits(animal_id, vetss_id, date_of_visit) VALUES (17, 2, '2019-12-21'),
(17, 1, '2020-05-04'),
(17, 2, '2021-04-07');
INSERT INTO visits(animal_id, vetss_id, date_of_visit) VALUES(18, 3, '2019-09-29');
INSERT INTO visits(animal_id, vetss_id, date_of_visit) VALUES(19, 4, '2020-10-03');
INSERT INTO visits (animal_id, vetss_id, date_of_visit) VALUES(19,4, '2020-11-04');
INSERT INTO visits (animal_id, vetss_id, date_of_visit) VALUES(20, 2, '2019-01-24');
INSERT INTO visits (animal_id, vetss_id, date_of_visit) VALUES(20, 2, '2019-05-15');
INSERT INTO visits (animal_id, vetss_id, date_of_visit) VALUES(20, 2, '2020-02-27');
INSERT INTO visits (animal_id, vetss_id, date_of_visit) VALUES(20, 2, '2020-08-03');
INSERT INTO visits (animal_id, vetss_id, date_of_visit) VALUES(21, 3, '2020-05-24');
INSERT INTO visits (animal_id, vetss_id, date_of_visit) VALUES(21, 1, '2021-01-11');