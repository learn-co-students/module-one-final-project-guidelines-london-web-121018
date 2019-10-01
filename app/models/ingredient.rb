class Ingredient < ActiveRecord::Base
    has_many :ingredientrecipes
    has_many :recipes, through: :ingredientrecipes

    def self.get_recipes_by_ingredient_name(name)
        recipe_collection = IngredientRecipe.where(ingredient_id: self.find_by_name(name).id)
        recipe_collection.collect do |rc, r| 
           Recipe.find_by_id(rc.recipe_id).name
        end
    end

    def self.get_all_ingredient_names
        Ingredient.all.collect do |ia, i|
            ia.name
        end
    end

    def self.ingredient_options
    <<-HEREDOC
    Find all ingredients
    find recipes that contain an ingredient
    Display nutritional facts of an ingredient

    Type "exit" to return to the main menu.
    HEREDOC
    end


    def self.ingredient_menu
        loop do
        puts StartUp.text_breather
        puts self.ingredient_options
        ingredient_choice = gets.chomp
        case ingredient_choice
            when "all", "alot", "al", "ll"
            puts self.get_all_ingredient_names
            when "recipes"
                ing_name = gets.chomp
            puts self.get_recipes_by_ingredient_name(ing_name)
            when "facts", "nutrition", "cool shit"
            puts "recipes with #{ingredient_choice}"
            when "exit"
                puts StartUp.text_breather
                puts "returning to main menu"
                puts StartUp.text_breather
                return
            else 
                puts "Sorry, no option exists"
            end
        end
    end

end
