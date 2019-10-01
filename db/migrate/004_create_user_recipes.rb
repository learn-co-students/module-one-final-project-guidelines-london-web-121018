class CreateUserRecipes < ActiveRecord::Migration
    def change
        create_table :user_recipes do |u|
            u.integer :user_id
            u.integer :recipe_id
        end
    end
end