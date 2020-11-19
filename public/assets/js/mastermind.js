
let ingredients = document.querySelectorAll('.ingredient');
    cauldronInside = document.getElementById('cauldronInside');

/*
function manageCauldron() {
    cauldronInside.innerHTML = '';

    for (let i = 0, c = ingredients.length; i < c; i++) {
        if (ingredients.className == 'ingredientSelected') {
            cauldron.appendChild(ingredients[i]);
        }
    }
}
*/


for (let i = 0, c = ingredients.length; i < c; i++) {
    ingredients[i].addEventListener('click', function(e) {
        if (this.className == 'ingredient') {
            this.className = 'ingredientSelected';
            this.name = this.id;

 //           manageCauldron();
        } else {
            this.className = 'ingredient';
            this.name = '';

   //         manageCauldron();
        }
    });
}

