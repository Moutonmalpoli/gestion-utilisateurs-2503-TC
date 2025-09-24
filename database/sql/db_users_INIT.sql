DROP TABLE IF EXISTS t_role;
DROP TABLE IF EXISTS t_user;

CREATE TABLE IF NOT EXISTS t_role 
(
	role_id INT AUTO_INCREMENT PRIMARY KEY,
	role_name VARCHAR(50) NOT NULL UNIQUE,
	role_register_code CHAR(128) NOT NULL,
	role_description VARCHAR(255) NULL
);

CREATE TABLE IF NOT EXISTS t_user 
(
	user_id INT AUTO_INCREMENT,
	user_email VARCHAR(50) NOT NULL,
	user_lastname VARCHAR(50) NOT NULL,
	user_firstname VARCHAR(50) NULL,
	user_password CHAR(128) NOT NULL,
	role_id INT NOT NULL,
	PRIMARY KEY (user_id),
	CONSTRAINT FK_roleId FOREIGN KEY (role_id) 
	REFERENCES t_role(role_id),
	UNIQUE (user_email)
);

/*ALTER TABLE t_user ADD CONSTRAINT FK_roleId FOREIGN KEY (role_id) REFERENCES t_role(role_id);*/

INSERT INTO t_role 
(role_name, role_register_code, role_description) 
VALUES 
('usager', '1234', 'Un utilisateur lambda'),
('encadrant', '1452', 'Les encadrants'),
('administrateur', '9874', 'Les super pouvoirs');


INSERT INTO t_user
(user_email, user_lastname, user_firstname, user_password, role_id)
VALUES
('john.doe@example.com', 'Doe', 'John', '4321','3'),
('tacitus.kilgore@example.com', 'Kilgore','Tacitus','1234','2'),
('jacques.chirac@example.com', 'Chirac', 'Jacques', 'azer', '2'),
('abigail.marston@example.com', 'Marston', 'Abigail', 'AZERTY', '1'),
('homer.simpson@example.com','Simpson', NULL ,'123456', '1');