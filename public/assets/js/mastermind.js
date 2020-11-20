
let ingredients = document.querySelectorAll('.ingredient'),
    cauldronInside = document.getElementById('cauldronInside'),
    mixIngredient = document.getElementById('mixIngredient'),
    classSelectedIngredient = document.getElementById('classSelectedIngredient'),
    classRemainingIngredient = document.getElementById('classRemainingIngredient'),
    urlPicture = '';

function infoIngredient(element, pLeft, pTop, pLeftIncrease, pTopIncrease, pLeftSpeed, pTopSpeed) {
    this.element = element;
    this.pLeft = pLeft = pLeft;
    this.pTop = pTop = pTop;
    this.pLeftIncrease = pLeftIncrease;
    this.pTopIncrease = pTopIncrease;
    this.pLeftSpeed = pLeftSpeed;
    this.pTopSpeed = pTopSpeed;
}

function randNum(min, max, integer) {
    if (!integer) {
        return Math.random() * (max - min) + min;
    } else {
        return Math.floor(Math.random() * (max - min) + min);
    }
}


mixIngredient.disabled = true;
mixIngredient.style.opacity = '0.2';
mixIngredient.style.cursor = 'default';

for (let i = 0, c = ingredients.length; i < c; i++) {
    if (/"(.+)"/i.test(ingredients[i].style.backgroundImage)) {
        urlPicture = RegExp.$1;
    }

    cauldronInside.innerHTML += '<img src="' + urlPicture + '" class="ingredientInsideCauldron" alt="' + ingredients[i].id + '" />';
}

let ingredientInsideCauldron = document.querySelectorAll('.ingredientInsideCauldron');

let ingredientsObject = [];

for (let i = 0, c = ingredientInsideCauldron.length; i < c; i++) {
    ingredientsObject.push(new infoIngredient(ingredientInsideCauldron[i], ingredientInsideCauldron[i].offsetLeft, ingredientInsideCauldron[i].offsetTop, false, false, randNum(0.5, 1), randNum(0.5, 1)));

    ingredientInsideCauldron[i].style.transform = 'scale(0)';
    ingredientInsideCauldron[i].style.width = '0px';
}


selectedIngredients = [];


function manageCauldron() {
    for (let i = 0, c = ingredientInsideCauldron.length; i < c; i++) {
        ingredientInsideCauldron[i].style.transform = 'scale(0)';
        ingredientInsideCauldron[i].style.width = '0px';
    }

    for (let i = 0, c = ingredients.length; i < c; i++) {
        if (ingredients[i].className == 'ingredientSelected') {
            for (let j = 0, d = ingredientInsideCauldron.length; j < d; j++) {
                if (ingredients[i].id == ingredientInsideCauldron[j].alt) {
                    ingredientInsideCauldron[j].style.transform = 'scale(1)';
                    ingredientInsideCauldron[i].style.width = '100px';
                }
            }
        }
    }

    selectedIngredients = [];

    for (let i = 0, c = ingredientInsideCauldron.length; i < c; i++) {
        if (ingredientInsideCauldron[i].style.width == '100px') {
            selectedIngredients.push(ingredientInsideCauldron[i]);
        }
    }

    classSelectedIngredient.innerHTML = 'Selected Ingredient : ' + selectedIngredients.length;
    classRemainingIngredient.innerHTML = 'Remaining Ingredient : ' + (4 - selectedIngredients.length);

    if (selectedIngredients.length == 4) {
        mixIngredient.disabled = false;
        mixIngredient.style.opacity = 1;
        mixIngredient.style.cursor = 'pointer';
    } else {
        mixIngredient.disabled = true;
        mixIngredient.style.opacity = 0.2;
        mixIngredient.style.cursor = 'default';
    }
}


for (let i = 0, c = ingredients.length; i < c; i++) {
    ingredients[i].addEventListener('click', function(e) {
        if (this.className == 'ingredient') {
            if (selectedIngredients.length != 4) {
                this.className = 'ingredientSelected';
                this.name = "ingredients[]";

                manageCauldron();
            }
        } else {
            this.className = 'ingredient';
            this.name = '';

            manageCauldron();
        }
    });
}


function animIngredient(element, pLeft, pTop, pLeftIncrease, pTopIncrease, pLeftSpeed, pTopSpeed) {
    if (element) {
        if (pLeft <= 0) {
            pLeftIncrease = true; 
        } else if (pLeft >= (cauldronInside.offsetWidth - 100)) {
            pLeftIncrease = false;
        }

        if (pLeftIncrease == false) {
            pLeft -= pLeftSpeed;
        } else {
            pLeft += pLeftSpeed;
        }

        if (pTop <= 0) {
            pTopIncrease = true; 
        } else if (pTop >= (cauldronInside.offsetHeight - 100)) {
            pTopIncrease = false;
        }

        if (pTopIncrease == false) {
            pTop -= pTopSpeed;
        } else {
            pTop += pTopSpeed;
        }

        element.style.left = pLeft + 'px';
        element.style.top = pTop + 'px';

        setTimeout(animIngredient, 10, element, pLeft, pTop, pLeftIncrease, pTopIncrease, pLeftSpeed, pTopSpeed);
    }
}


for (let i = 0, c = ingredientsObject.length; i < c; i++) {
    animIngredient(ingredientsObject[i].element, ingredientsObject[i].pLeft, ingredientsObject[i].pTop, ingredientsObject[i].pLeftIncrease, ingredientsObject[i].pTopIncrease, ingredientsObject[i].pLeftSpeed, ingredientsObject[i].pTopSpeed);
}


