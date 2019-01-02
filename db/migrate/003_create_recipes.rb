class CreateRecipes < ActiveRecord::Migration[4.2]
    def change
        create_table :recipes do |r|
            r.string :name
            r.string :meal_of_the_day
            r.string :description
            r.string :method
            r.timestamp
            r.float :rating
        end
    end
end 
