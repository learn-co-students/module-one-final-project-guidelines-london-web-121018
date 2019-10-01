class Recipe < ActiveRecord::Base
    has_many :userrecipes
    has_many :users, through: :userrecipes

    has_many :ingredientrecipes
    has_many :ingredients, through: :ingredientrecipes

    def self.get_all_recipe_names
        Recipe.all.collect do |ra, r|
            ra.name
        end
    end

    def self.set_recipe 
    end
    

    def self.get_rating_above_value(no)
        recipe_collection = Recipe.where("no_of_likes > ?", no)
        recipe_collection.collect do |rc, r| 
            rc.name
         end
    end

    def self.top_10_recipes
       recipe_collection = Recipe.order("no_of_likes DESC").first(10)
        recipe_collection.collect do |rc, r| 
            rc.name
         end
    end

    def self.random_5_recipes
        recipe_collection = Recipe.order("RANDOM()").first(5)
        recipe_collection.collect do |rc, r| 
            rc.name
         end
    end

    def self.like_recipe(user_name, recipe_name)
        if !self.find_by_name(recipe_name)
            return "Recipe does not exist"
       end
        u_id = User.find_by_name(user_name).id
        r_id = self.find_by_name(recipe_name).id
        
        if UserRecipe.find_by(user_id: u_id, recipe_id: r_id, liked: true)
            return "You have already like this recipe"
            
        elsif 
            User.save_recipe_to_user(user_name,recipe_name)
           puts "Saved #{recipe_name} to your liked recipes"
           recipe = self.find_by_name(recipe_name)
           recipe.no_of_likes +=1
           recipe.save
           UserRecipe.last.liked = true
           UserRecipe.last.save
           return "#{recipe_name} has been liked and now has a total #{recipe.no_of_likes} likes."
        end
     end

     def self.get_recipe_mealtime(meal_time)
        if !Recipe.find_by_meal_of_the_day(meal_time)
            puts "This meal time doesn't exist"
        end
        recipe_collection = Recipe.where("meal_of_the_day > ?", meal_time)
        recipe_collection.collect do |rc, r| 
            rc.name
         end
    end

    def self.save_ingredient_to_recipe(recipe_name,ingredient_name)
        if !Ingredient.find_by_name(ingredient_name)
            return "Ingredient does not exist in the database"
        end
        i_id = Ingredient.find_by_name(ingredient_name).id
        r_id = self.find_by_name(recipe_name).id
        if IngredientRecipe.find_by(ingredient_id: i_id, recipe_id: r_id)
            return "The ingredient is already included into the recipe"
    
        else
        IngredientRecipe.create(ingredient_id: i_id, recipe_id: r_id)
        puts "Saved #{ingredient_name} to recipe"
        end
    end


    def self.recipe_options
    <<-HEREDOC
    All
    Time of day
    Most popular
    Random

    Type "exit" to return to the main menu.
    HEREDOC
    end


    def self.recipe_menu
        loop do
        puts StartUp.text_breather
        puts self.recipe_options
        recipe_choice = gets.chomp
        case recipe_choice.downcase
            when "all", "alot", "al", "ll"
            puts self.get_all_recipe_names
            when "most popular", "best", "popular", "pop"
            puts self.top_10_recipes
            when "time", "day", "night"
                puts StartUp.text_breather
                puts "Enter a meal time..."
                meal_time = gets.chomp
                puts self.get_recipe_mealtime(meal_time)
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