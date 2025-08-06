
// Formulaire utilisateur-ajouter

const AdduserForm = document.getElementById("add-user")
const UserName = document.getElementById("user-name")
const UserFirstname = document.getElementById("user-firstname")
const UserEmail = document.getElementById("user-email")
const UserRole = document.getElementById("user-role")
const UserDate = document.getElementById("user-date")
const UserDescription = document.getElementById("user-description")
const AddUserButton = document.getElementById("btn-subuser")


//formulaire role-ajouter
const roleName = document.getElementById("role-name")
const roleDescription = document.getElementById("role-description")
const AddRoleButton = document.getElementById("btn-subrole")

//  Tableau utilisateur.html
const UserTable = document.getElementById("table-user")

ListUser = []
ListRole = []



function AddUser(event) {
    event.preventDefault()

    CheckInputUser()

    if (CheckInputUser()) {

        ListUser.push({
            name: UserName.value.trim(),
            firstName: UserFirstname.value.trim(),
            email: UserEmail.value.trim().toLowerCase(),
            role: UserRole.value,
            date: UserDate.value,
            description: UserDescription.value

        })
        result.textContent = "Utilisateur ajouté"
    }



}

function AddRole(event) {
    event.preventDefault()


    CheckInputRole()
if (CheckInputRole()) {
        ListRole.push({
            name: roleName.value,
            description: roleDescription.value

        })
        result.textContent = "Rôle ajouté"



    }
}


function CheckInputUser() {

    const name = UserName.value.trim()
    const firstName = UserFirstname.value.trim()



    const regex = /^[a-zA-ZÀ-ÿ]+$/;
    if (!regex.test(name) || !regex.test(firstName)) {
        result.textContent = "Les noms ne peuvent contenir que des lettres."
        return false
    }


    else if (name.length < 3 || firstName.length < 3) {
        result.textContent = "Les noms doivent comporter au moins 3 caractères."
        return false
    }

    else if (ListUser.some(user => user.name === name && user.firstName === firstName)) {
        result.textContent = "Cet utilisateur existe déjà."
        return false
    }
    else if (ListUser.some(user => user.email === UserEmail.value.trim().toLowerCase())) {
        result.textContent = "Cet email est déjà utilisé."
        return false

    }
    else if (!ListRole.includes(UserRole.value)) {
        result.textContent = "Le rôle sélectionné n'est pas valide."
        return false
    }
    else {
        return true
    }


}
function CheckInputRole() {
    const name = roleName.value.trim()
    const description = roleDescription.value.trim()
    const regex = /^[a-zA-ZÀ-ÿ]+$/;
    if (!regex.test(name)) {
        result.textContent = "Le nom du rôle ne peut contenir que des lettres."
        return false
    }
    else if (name.length < 3) {
        result.textContent = "Le nom du rôle doit comporter au moins 3 caractères."
        return false
    }

        else if (description.length < 10) {
        result.textContent = "La description du rôle doit comporter au moins 10 caractères."
        return false
    }
    else if (ListRole.some(role => role.name === name)) {
        result.textContent = "Ce rôle existe déjà."
        return false
    }


    else {
        return true
    }
}
//AddUserButton.addEventListener("click", AddUser)
AddRoleButton.addEventListener("click", AddRole)




console.log(ListRole)

