/*Modifier la table t_role.
Ajouter une colonne role_level (nombre entier, obligatoire, valeur par défaut=0)
La colonne role_level permettra de connaitre le niveau d'autorisation du rôle.*/

ALTER TABLE t_role
	ADD COLUMN role_level INT NOT NULL DEFAULT '0';

/*Mettre à jour le niveau de chaque rôle:
role_id role_level
1 -> 0
2-> 9
3 -> 10
*/

UPDATE t_role SET role_level=0 WHERE role_id=1;

UPDATE t_role SET role_level=9 WHERE role_id=2;

UPDATE t_role SET role_level=10 WHERE role_id=3;

/*
Ajouter les rôle suivants:
Employé | les salariés| 123456 | 1
Cadre | les managers |987654|2
Dirigeant | La Big Boss|999999| 8
*/

INSERT INTO t_role
(role_name, role_description,role_register_code, role_level)
VALUES
('Employé','Les salariés','123456','1'),
('Cadre','Les managers','987654','2'),
('Dirigeant','La Big Boss','999999','8');


/*
Ajouter les 5 utilisateurs suivants

user_lastname 	user_firstname 	user_email 	user_password 	role_name
Danloss 	Ella 	ella.danloss@example.com 	12345 	employé
Golay 	Jerry 	j.golay@example.fr 	azerty 	employé
Camant 	Medhi 	medhi@example.fr 	password 	cadre
Javelle 	Aude 	aj@example.com 	121180 	employé
Scroute 	Jessica 	jescr@example.fr 	231297 	dirigeant

*/

INSERT INTO t_user
(user_lastname, user_firstname, user_email, user_password, role_id)
VALUES
('Danloss', 'Ella', 'ella.danloss@example.com', '12345', 4),
('Golay', 'Jerry', 'j.golay@example.fr', 'azerty', 4),
('Camant', 'Medhi', 'medhi@example.fr', 'password', 5),
('Javelle', 'Aude', 'aj@example.com', '121180', 4),
('Scroute', 'Jessica', 'jescr@example.fr', '231297', 6);
