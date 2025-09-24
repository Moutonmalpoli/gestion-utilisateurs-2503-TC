/* Modifier le nom du rôle n°2 en "Modérateur".*/
/* Mettre a jour la table role, modifier le nom du role ou ce situe id du role n°2*/

UPDATE t_role SET role_name='modérateur' WHERE role_id=2;

/* Modifier le role n°1*/
/*Pour faire plusieurs modifications en une seule requètes*/

UPDATE t_role SET role_name='padawan', role_description='les petits nouveaux' WHERE role_id=1;


/*Selectionner toutes les informations de tous les rôles.*/

SELECT * FROM t_role;
SELECT role_id, role_name, role_description, role_register_code FROM t_role ORDER BY role_description DESC, role_name ASC;

/*Selectionner l'identifiant, le nom du rôle et la description de chaque rôle.*/
SELECT role_id, role_name, role_description FROM t_role;


/*Sélectionner l'identifiant et le nom du rôle n°3*/

SELECT role_id, role_name FROM t_role WHERE role_id=3

/*Selectionner l'identifiant, le nom et la descrition du rôle dont le libellé est "Encadrant*/

SELECT role_id, role_name, role_description FROM t_role WHERE role_name='modérateur'

/*Selectionner toutes les information des rôle dont la description est vide*/
SELECT role_id, role_name, role_description, role_register_code FROM t_role WHERE role_description ='' OR role_description IS NULL;

/*Selectionner toutes les information des rôle dont la description n'est pas vide*/
SELECT role_id, role_name, role_description, role_register_code FROM t_role WHERE role_description <>'' AND role_description IS NOT NULL;

/* Selectionner l'identifiant et le nom des rôles dont le nom contient la chaine "ra"*/
SELECT role_id, role_name FROM t_role WHERE role_name LIKE '%ra%'; 

/* Selectionner l'identifiant, le nom et la description  des rôles dont le nom commance par la lettre "r"*/
SELECT role_id, role_name FROM t_role WHERE role_name LIKE 'r%'; 

/* Selectionner l'identifiant, le nom et la description  des rôles dont le nom se termine par la lettre "r"*/
SELECT role_id, role_name FROM t_role WHERE role_name LIKE '%r'; 