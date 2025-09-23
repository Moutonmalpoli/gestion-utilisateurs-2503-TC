CREATE TABLE IF NOT EXISTS t_role 
(
	role_id INT AUTO_INCREMENT PRIMARY KEY,
	role_name VARCHAR(50) NOT NULL UNIQUE,
	role_register_code CHAR(128) NOT NULL,
	role_description VARCHAR(255) NULL
);


INSERT INTO t_role 
(role_name, role_register_code, role_description) 
VALUES 
('usager', '1234', 'Un utilisateur lambda'),
('encadrant', '1452', 'Les encadrants'),
('administrateur', '9874', 'Les super pouvoirs');


CREATE TABLE IF NOT EXISTS t_user 
(
	user_id INT AUTO_INCREMENT,
	user_email VARCHAR(50) NOT NULL,
	user_lastname VARCHAR(50) NOT NULL,
	user_firstname VARCHAR(50) NULL,
	user_password CHAR(128) NOT NULL,
	role_id INT NOT NULL,
	PRIMARY KEY (user_id),
	UNIQUE (user_email)
);

