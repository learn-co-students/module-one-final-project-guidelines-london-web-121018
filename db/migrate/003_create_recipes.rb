class CreateRecipes < ActiveRecord::Migration
    def change
        create_table :recipes do |r|
            r.string :name
            r.string :meal_of_the_day
            r.string :description
            r.string :list_of_ingredients
            r.string :method
            r.timestamp
            #r.float :avg_rating
            r.integer :no_of_likes
        end
    end
end 
