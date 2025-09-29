/*1: Sélectionner tous les utilisateurs (identifiant nom, prénom, email et nom du rôle).*/

/* Sans jointure */
SELECT user_id, user_firstname, user_lastname, user_email, role_name
FROM t_user, t_role
WHERE t_user.role_id=t_role.role_id

/* Avec jointure */
/* On fait la jointure entre la table t_user et t_role en utilisant la clé étrangère role_id dans t_user.*/
SELECT user_id, user_firstname, user_lastname, user_email, role_name
FROM t_user
INNER JOIN t_role ON t_user.role_id = t_role.role_id;

/*2: Sélectionner tous les utilisateurs (identifiant nom, prénom, email, identifiant du rôle, nom du rôle). 
Trier les résultats par identifiant de rôle par ordre décroissant puis par nom de famille par ordre croissant.*/

/* Sans jointure */
SELECT user_id, user_firstname, user_lastname, user_email, role_id
FROM t_user
ORDER BY role_id DESC, user_lastname ASC;

/* Avec jointure */
SELECT user_id, user_firstname, user_lastname, user_email, t_role.role_id, t_role.role_name
FROM t_user
INNER JOIN t_role ON t_user.role_id = t_role.role_id
ORDER BY t_role.role_id DESC, user_lastname ASC;

/*3:Sélectionner tous les utilisateurs (identifiant nom, prénom, email, identifiant du rôle, nom du rôle) qui possèdent le rôle n°2 */
SELECT user_id, user_firstname, user_lastname, user_email, t_role.role_id, role_name
FROM t_user
INNER JOIN t_role ON t_user.role_id = t_role.role_id
WHERE t_user.role_id=2;

/*4: Sélectionner le nombre d'utilisateurs.*/
SELECT COUNT(user_id) FROM t_user;

/*5: Sélectionner, dans les rôles, le plus grand identifiant.*/
SELECT MAX(role_id) FROM t_role;

/* 6: Sélectionner tous les rôles (identifiant du rôle, nom du rôle, description du rôle). 
Pour chaque rôle, afficher le nombre d'utilisateurs concernés.*/
SELECT t_role.role_id, role_name, role_description, COUNT(user_id) AS nb_users
FROM t_role
INNER JOIN t_user ON t_user.role_id = t_role.role_id
GROUP BY t_role.role_id;

/* 7: Selectionner la moyenne du nombre d'utilisateurs par rôle. */

SELECT (SELECT COUNT(user_id)FROM t_user) / (SELECT COUNT(role_id)FROM t_role);

/* 8: Sélectionner nom, prénom, nom du rôle de tous les utilisateurs avec pour chaque utilisateur l'identifiant et nom de l'utilisateur possédant le même rôle et l'identifiant le plus petit.*/


/* Vu que l'on va comparer les utilisateurs entre eux,
 on utilise des alias pour différencier deux instances de la table t_user
 à savoir u1 pour le premier et u2 pour le second. */
SELECT u1.user_id, u1.user_lastname, u1.user_firstname, t_role.role_name,
	   u2.user_id AS user_2_id,
		u2.user_lastname AS user_2_lastname
		

/* On fait une auto-jointure de la table t_user pour comparer u1 et u2 entre eux. */

FROM t_user AS u1
INNER JOIN t_role ON u1.role_id = t_role.role_id
INNER JOIN t_user AS u2 ON u1.role_id = u2.role_id
WHERE u2.user_id = (SELECT MIN(user_id) FROM t_user WHERE role_id = u1.role_id AND u2.user_id <> u1.user_id);