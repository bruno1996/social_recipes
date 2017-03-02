class AddKitchenRefToRecipes < ActiveRecord::Migration[5.0]
  def change
    add_reference :recipes, :kitchen, foreign_key: true
  end
end
