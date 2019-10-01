require_relative '../config/environment'



puts StartUp.welcome_app

puts StartUp.text_breather
sleep(3)
StartUp.clearConsole



loop do
    puts StartUp.start_menu
    menu_choice_1 = gets.chomp
    case menu_choice_1.downcase
    when "login"
        StartUp.clearConsole
        User.user_menu
    when "recipes"
        StartUp.clearConsole
        Recipe.recipe_menu
    when "ingredients"
        StartUp.clearConsole
        Ingredient.ingredient_menu
    when "users"
        StartUp.clearConsole
        puts User.get_all_user_names
    when "exit"
        puts "Thank you"
        exit 
    else
        puts "The search #{menu_choice_1} doesn't exist"
    end
end