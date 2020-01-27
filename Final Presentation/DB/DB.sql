
CREATE SEQUENCE admin_username_seq;

CREATE TABLE Admin (
                username INTEGER NOT NULL DEFAULT nextval('admin_username_seq'),
                first_name VARCHAR NOT NULL,
                last_name VARCHAR NOT NULL,
                phone VARCHAR NOT NULL,
                CONSTRAINT username PRIMARY KEY (username)
);


ALTER SEQUENCE admin_username_seq OWNED BY Admin.username;

CREATE TABLE Admin_Authentication (
                admin_auth_id INTEGER NOT NULL,
                username INTEGER NOT NULL,
                password VARCHAR NOT NULL,
                last_login_date DATE NOT NULL,
                CONSTRAINT admin_auth_id PRIMARY KEY (admin_auth_id)
);


CREATE SEQUENCE package_package_id_seq;

CREATE TABLE Package (
                package_id INTEGER NOT NULL DEFAULT nextval('package_package_id_seq'),
                package_name VARCHAR NOT NULL,
                package_link VARCHAR NOT NULL,
                package_price INTEGER NOT NULL,
                CONSTRAINT package_id PRIMARY KEY (package_id)
);


ALTER SEQUENCE package_package_id_seq OWNED BY Package.package_id;

CREATE SEQUENCE coach_username_seq;

CREATE TABLE Coach (
                username INTEGER NOT NULL DEFAULT nextval('coach_username_seq'),
                first_name VARCHAR NOT NULL,
                last_name VARCHAR NOT NULL,
                phone VARCHAR NOT NULL,
                aboutme VARCHAR NOT NULL,
                CONSTRAINT username PRIMARY KEY (username)
);


ALTER SEQUENCE coach_username_seq OWNED BY Coach.username;

CREATE TABLE Coach_Authentication (
                coach_auth_id INTEGER NOT NULL,
                username INTEGER NOT NULL,
                password VARCHAR NOT NULL,
                last_login_date DATE NOT NULL,
                CONSTRAINT coach_auth_id PRIMARY KEY (coach_auth_id)
);


CREATE SEQUENCE athlete_username_seq;

CREATE TABLE Athlete (
                username INTEGER NOT NULL DEFAULT nextval('athlete_username_seq'),
                first_name VARCHAR NOT NULL,
                last_name VARCHAR NOT NULL,
                phone VARCHAR NOT NULL,
                CONSTRAINT username PRIMARY KEY (username)
);


ALTER SEQUENCE athlete_username_seq OWNED BY Athlete.username;

CREATE SEQUENCE purchase_purchase_id_seq;

CREATE TABLE Purchase (
                purchase_id INTEGER NOT NULL DEFAULT nextval('purchase_purchase_id_seq'),
                username INTEGER NOT NULL,
                package_id INTEGER NOT NULL,
                CONSTRAINT purchase_id PRIMARY KEY (purchase_id)
);


ALTER SEQUENCE purchase_purchase_id_seq OWNED BY Purchase.purchase_id;

CREATE SEQUENCE contract_contract_id_seq;

CREATE TABLE Contract (
                contract_id INTEGER NOT NULL DEFAULT nextval('contract_contract_id_seq'),
                athlete_username INTEGER NOT NULL,
                coach_username INTEGER NOT NULL,
                status VARCHAR DEFAULT 0,
                begin_date DATE NOT NULL,
                end_date DATE NOT NULL,
                price INTEGER NOT NULL,
                CONSTRAINT contract_id PRIMARY KEY (contract_id)
);


ALTER SEQUENCE contract_contract_id_seq OWNED BY Contract.contract_id;

CREATE TABLE Athlete_Authentication (
                athlete_auth_id INTEGER NOT NULL,
                username INTEGER NOT NULL,
                password VARCHAR NOT NULL,
                last_login_date DATE NOT NULL,
                CONSTRAINT athlete_auth_id PRIMARY KEY (athlete_auth_id)
);


CREATE SEQUENCE ticket_ticket_id_seq;

CREATE TABLE Ticket (
                ticket_id INTEGER NOT NULL DEFAULT nextval('ticket_ticket_id_seq'),
                username INTEGER NOT NULL,
                ticket_subject VARCHAR NOT NULL,
                ticket_body VARCHAR NOT NULL,
                ticket_date DATE NOT NULL,
                ticket_status VARCHAR NOT NULL,
                CONSTRAINT ticket_id PRIMARY KEY (ticket_id)
);


ALTER SEQUENCE ticket_ticket_id_seq OWNED BY Ticket.ticket_id;

ALTER TABLE Admin_Authentication ADD CONSTRAINT admin_admin_authentication_fk
FOREIGN KEY (username)
REFERENCES Admin (username)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Purchase ADD CONSTRAINT package_purchase_fk
FOREIGN KEY (package_id)
REFERENCES Package (package_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Coach_Authentication ADD CONSTRAINT coach_coach_authentication_fk
FOREIGN KEY (username)
REFERENCES Coach (username)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Contract ADD CONSTRAINT coach_contract_fk
FOREIGN KEY (coach_username)
REFERENCES Coach (username)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Ticket ADD CONSTRAINT athlete_ticket_fk
FOREIGN KEY (username)
REFERENCES Athlete (username)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Athlete_Authentication ADD CONSTRAINT athlete_athlete_authentication_fk
FOREIGN KEY (username)
REFERENCES Athlete (username)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Contract ADD CONSTRAINT athlete_contract_fk
FOREIGN KEY (athlete_username)
REFERENCES Athlete (username)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Purchase ADD CONSTRAINT athlete_purchase_fk
FOREIGN KEY (username)
REFERENCES Athlete (username)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
