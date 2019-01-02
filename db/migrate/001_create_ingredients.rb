class CreateIngredients < ActiveRecord::Migration
    def change
        create_table :ingredients do |i|
            i.string :name
            i.float :calories
            i.float :protein
            i.float :fat
            i.float :carbs
        end
    end
end
