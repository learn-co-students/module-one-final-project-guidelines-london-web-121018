class User < ActiveRecord::Base
    has_many :userrecipes
    has_many :recipes, through: :userrecipes

    def self.get_all_user_names
        self.all.collect do |ua, u|
            ua.name
        end
    end


    def self.get_recipes_by_user_name(name)
            recipe_collection = UserRecipe.where(user_id: self.find_by_name(name).id)
            if recipe_collection.empty?
                puts "You currently have no saved recipes"
                puts "Here is a list of popular recipes to get you started:"
                puts StartUp.text_breather
                Recipe.random_5_recipes
            else
            recipe_collection.collect do |rc, r| 
                Recipe.find_by_id(rc.recipe_id).name
            end
        end
    end

    def self.save_recipe_to_user(user_name,recipe_name)
        if !Recipe.find_by_name(recipe_name)
            return "Recipe does not exist in the database"
        end
        r_id = Recipe.find_by_name(recipe_name).id
        u_id = self.find_by_name(user_name).id
        if UserRecipe.find_by(user_id: u_id, recipe_id: r_id)
            return "Recipe is already added to your account"
    
        else
        UserRecipe.create(user_id: u_id, recipe_id: r_id, liked: false)
        puts "Saved #{recipe_name} to your account"
        end
    end

    def self.login
        user_name = gets.chomp
        if self.find_by_name(user_name)
            puts "Welcome #{user_name}"
            return user_name
        else
            puts "I'm sorry, you don't appear to be part of the app"
            puts "Would you like to sign up? Yes / No"
            y_n_choice = gets.chomp
            case y_n_choice.downcase
            when "yes", "y","ja","oui"
                puts "Please enter your name"
                u_name = gets.chomp
        
                puts "Please enter an email"
                e_mail = gets.chomp
        
                self.create(name: u_name, email: e_mail)   
                return user_name
                puts <<-HEREDOC 
                Your account has been created
                You can now
                save,rate & create recipes
                HEREDOC
                
            when "no","n", "non"
                puts "Maybe another time"
                return
            else
                puts "Nice maybe read the instructions"
                return 
            end
       end
    end

    

    def self.user_menu
        puts "please enter your user name"
        current_user = self.login

        loop do
            puts StartUp.text_breather
            puts StartUp.menu_signed_in
            menu_logged_choice_1 = gets.chomp
            case menu_logged_choice_1.downcase
                when "recipes"
                    Recipe.recipe_menu
                when "save", "add"
                    puts "Name a recipe that you want to add"
                    recipe_name = gets.chomp
                   puts self.save_recipe_to_user(current_user,recipe_name)
                when "rate", "like", "rate recipe", "like recipe"
                    recipe_name = gets.chomp
                    puts Recipe.like_recipe(current_user, recipe_name)
                when "my recipes", "mine"
                    puts self.get_recipes_by_user_name(current_user)
                when "ingredients"
                    Ingredient.ingredient_menu
                when "add", "+"
                    Ingredient.ingredient_menu
                when "exit", "sign out", "log off"
                    puts StartUp.text_breather
                    puts "returning to main menu"
                    return
                else
                   puts "That option doesn't exist"         
            end
        end
    end
    
end



