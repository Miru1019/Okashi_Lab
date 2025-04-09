class AddIngredientsAndInstructionsToRecipes < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes, :ingredients, :text
    add_column :recipes, :instructions, :text
  end
end
