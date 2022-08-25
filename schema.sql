/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id integer PRIMARY KEY,
    name varchar(500), 
    date_of_birth date, 
    escape_attempts integer, 
    neutered boolean,
    weight_kg decimal,
    species text
);

-- creating tables

CREATE TABLE owners (
    id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
    full_name text, 
    age integer
);

CREATE TABLE species (
    id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
    name VARCHAR(200)
);

-- Modify animals table:
ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD COLUMN species_id integer references species(id);
ALTER TABLE animals ADD COLUMN owner_id integer references owners(id);

CREATE TABLE vets (
    id integer GENERATED ALWAYS AS IDENTITY,
    name text, 
    age integer,
    date_of_graduation date,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS specializations (
  species_id INT,
  vet_id     INT,
  PRIMARY KEY (species_id, vet_id),
  FOREIGN KEY (vet_id) REFERENCES vets (id) ON DELETE CASCADE,
  FOREIGN KEY (species_id) REFERENCES species (id) ON DELETE CASCADE
);

CREATE TABLE visits (animal_id integer, vetss_id integer,
FOREIGN KEY(animal_id) REFERENCES animals(id) ON DELETE CASCADE,
FOREIGN KEY (vetss_id) REFERENCES vets(id) ON DELETE CASCADE,
PRIMARY KEY(animal_id, vetss_id)
);
 ALTER TABLE visits ADD COLUMN date_of_visit date;