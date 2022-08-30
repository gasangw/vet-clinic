CREATE TABLE medical_histories(
    id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    admitted_at timestamp,
    patient_id integer REFERENCES patients(id)
);

CREATE TABLE patients (
    id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name varchar(100),
    date_of_birth date
);

CREATE TABLE invoices(
    id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    total_amount float,
    generated_at timestamp,
    payed_at timestamp,
    medical_history_id INT REFERENCES medical_histories(id)
);

CREATE TABLE invoice_item(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    unit_price float,
    quantity INT,
    total_price float,
    invoice_id INT REFERENCES invoices(id)
    treatment_id INT REFERENCES treatments(id)
);

CREATE TABLE treatments(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    type varchar(100),
    name varchar(100)
);

CREATE TABLE medical_histories_treatment(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    medical_histories_id INT REFERENCES medical_histories(id),
    treatments_id INT REFERENCES treatments(id)
);

CREATE INDEX patient_id_index ON medical_histories(patient_id);
CREATE INDEX medical_history_index ON invoices(medical_history_id);
CREATE INDEX invoice_id_index ON invoice_item(invoice_id);
CREATE INDEX treatment_id_index ON invoice_item(treatment_id);
CREATE INDEX medical_histories_id_index ON medical_histories_treatment(medical_histories_id);
CREATE INDEX treatments_id_index ON medical_histories_treatment(treatments_id);
