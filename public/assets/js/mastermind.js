
let ingredients = document.querySelectorAll('.ingredient');
    cauldronInside = document.getElementById('cauldronInside'),
    ingredientInsideCauldron = null;

// <input id="{{ ingredient.name }}" type="text" readonly class="ingredient" style="background: url('/assets/images/{{ ingredient.image }}'); background-size: 101% 101%;" value="{{ ingredient.name }}" />

let pLeft = 0,
    pTop = 0
    pLeftIncrease = false,
    pTopIncrease = false;


function manageCauldron() {
    cauldronInside.innerHTML = '';

    let urlPicture = '';

    for (let i = 0, c = ingredients.length; i < c; i++) {
        if (ingredients[i].className == 'ingredientSelected') {
            if (/"(.+)"/i.test(ingredients[i].style.backgroundImage)) {
                urlPicture = RegExp.$1;
            }

            cauldronInside.innerHTML += '<img src="' + urlPicture + '" class="ingredientInsideCauldron" alt="' + ingredients[i].id + '" />';
        }
    }
}


for (let i = 0, c = ingredients.length; i < c; i++) {
    ingredients[i].addEventListener('click', function(e) {
        ingredientInsideCauldron = document.querySelectorAll('.ingredientInsideCauldron');

        if (this.className == 'ingredient') {
            if (ingredientInsideCauldron.length != 2) {
                this.className = 'ingredientSelected';
                this.name = this.id;

                manageCauldron();
            }
        } else {
            this.className = 'ingredient';
            this.name = '';

            manageCauldron();
        }
    });
}


