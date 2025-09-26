/*1: Sélectionner tous les utilisateurs (identifiant nom, prénom, email et nom du rôle).*/

/* Sans jointure */
SELECT user_id, user_firstname, user_lastname, user_email, role_name 
FROM t_user, t_role 
WHERE t_user.role_id=t_role.role_id


/* Avec jointure */
/* On fait la jointure entre la table t_user et t_role en utilisant la clé étrangère role_id dans t_user qui référence la clé primaire role_id dans t_role.*/

SELECT user_id, user_firstname, user_lastname, user_email, t_role.role_name FROM t_user 
INNER JOIN t_role ON t_user.role_id = t_role.role_id;


/*2: Sélectionner tous les utilisateurs (identifiant nom, prénom, email, identifiant du rôle, nom du rôle). 
Trier les résultats par idetnfiant de rôle par ordre décroissant puis par nom de famille par ordre croissant.*/

/* Sans jointure */

SELECT user_id, user_firstname, user_lastname, user_email, role_id FROM t_user ORDER BY role_id DESC, user_lastname ASC;

/* Avec jointure */

SELECT user_id, user_firstname, user_lastname, user_email, t_role.role_id, t_role.role_name FROM t_user 
INNER JOIN t_role ON t_user.role_id = t_role.role_id
ORDER BY t_role.role_id DESC, user_lastname ASC;

/*3:Sélectionner tous les utilisateurs (identifiant nom, prénom, email, identifiant du rôle, nom du rôle) qui possèdent le rôle n°2 */
SELECT user_id, user_firstname, user_lastname, user_email, t_role.role_id, t_role.role_name FROM t_user
INNER JOIN t_role ON t_user.role_id = t_role.role_id
WHERE t_user.role_id=2;

/*4: Sélectionner le nombre d'utilisateurs.*/
SELECT COUNT(*) FROM t_user;

/*5: Sélectionner, dans les rôles, le plus grand identifiant.*/
SELECT MAX(role_id) FROM t_role;

/* Sélectionner tous les rôles (identifiant du rôle, nom du rôle, description du rôle). 
Pour chaque rôle, afficher le nombre d'utilisateurs concernés.*/

SELECT t_role.role_id, role_name, role_description, COUNT(t_user.user_id) AS nb_users FROM t_role
INNER JOIN t_user ON t_user.role_id = t_role.role_id
GROUP BY t_role.role_id;