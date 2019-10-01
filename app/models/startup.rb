class StartUp

    #Console clean up methods
    def self.clearConsole 
        system('clear')
    end

    def self.welcome_app
<<-HEREDOC
      Hi!
      Welcome to Try Vegan, the app that can help you bring
      confidence to trying veganism and bring to more
      excitement to cooking.

      You can search for vegan ingredients, search for recipes
      & even save them to you personally.

      Of course you don't need to save them at all, but we highly
      encourage you to do so.
    HEREDOC
    end

    def self.text_breather
    <<-HEREDOC
        
    
    HEREDOC
    end

    def self.start_menu
    <<-HEREDOC
To start; Search,
    recipes
    ingredients
    login

    Or exit
    HEREDOC
    end

    def self.menu_signed_in
    <<-HEREDOC
Search,
recipes
mine
ingredients
Rate
save
add
Or sign out
    HEREDOC
        end


    def self.break_line
        puts "--------------------------------"
        puts "--------------------------------"
    end
end