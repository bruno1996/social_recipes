class RemoveTypeoffoodFromRecipes < ActiveRecord::Migration[5.0]
  def change
    remove_column :recipes, :type_of_food, :string
  end
end
