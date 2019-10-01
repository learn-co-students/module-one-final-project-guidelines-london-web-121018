

User.create(name: "dan", email: "dan@gitgud.com")
User.create(name: "fernando", email: "fernando@gitgud.com")
User.create(name: "linzell", email: "linzell@gitgud.com")
User.create(name: "dick", email: "dick@gitgud.com")

Ingredient.create(name:"chestnut", calories:4.1 ,protein: 6.7 ,fat: 0.9, carbs:346.45)
Ingredient.create(name:"chestnut mushroom", calories:6.5 ,protein: 6.7 ,fat: 0.9, carbs:340.45)
Ingredient.create(name:"Miso", calories:3.5 ,protein: 6.7 ,fat: 1.9, carbs:140.45)
Ingredient.create(name:"maple syrup", calories:0.5 ,protein: 6.7 ,fat: 500.9, carbs:320.45)
Ingredient.create(name:"oats", calories:4.5 ,protein: 6.3 ,fat: 0.9, carbs:34.45)
Ingredient.create(name:"brocolli", calories:4.2 ,protein: 6.7 ,fat: 0.9, carbs:0.45)
Ingredient.create(name:"potato", calories:4.2 ,protein: 6.7 ,fat: 0.9, carbs:0.45)


Recipe.create(name:"Porridge", meal_of_the_day: "breakfast", description:"a good start to the day", list_of_ingredients: "oats", method: "microwave, or simmer in a pan", no_of_likes: 0)
Recipe.create(name:"bark", meal_of_the_day: "breakfast", description:"simple and fast", list_of_ingredients: "chestnut mushroom, chestnut, oats", method: "", no_of_likes: 5)
Recipe.create(name:"Miso mash", meal_of_the_day: "lunch", description:"umami & mash", list_of_ingredients: "Miso, potato", method: "mash potatos, then and a tablespoon of miso. Mix", no_of_likes: 4)
Recipe.create(name:"Maple butter", meal_of_the_day: "snack", description:"sweetest of sweet", list_of_ingredients: "maple syrup", method: "boil until reduced. Then cool", no_of_likes: 32)




IngredientRecipe.create(ingredient_id: 5,recipe_id: 1)
IngredientRecipe.create(ingredient_id: 4,recipe_id: 4)
IngredientRecipe.create(ingredient_id: 4,recipe_id: 2)
IngredientRecipe.create(ingredient_id: 4,recipe_id: 3)

UserRecipe.create(user_id: 5,recipe_id: 1)
UserRecipe.create(user_id: 4,recipe_id: 4)
UserRecipe.create(user_id: 4,recipe_id: 2)
UserRecipe.create(user_id: 4,recipe_id: 3)
