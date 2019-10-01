class CreateIngredientRecipes < ActiveRecord::Migration
    def change
        create_table :ingredient_recipes do |i|
            i.integer :ingredient_id
            i.integer :recipe_id
        end
    end
end