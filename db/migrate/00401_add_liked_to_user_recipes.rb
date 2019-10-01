class AddLikedToUserRecipes < ActiveRecord::Migration
    def change
        add_column :user_recipes, :liked, :boolean
    end
end