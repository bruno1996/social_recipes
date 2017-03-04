class AddTypeRefToRecipes < ActiveRecord::Migration[5.0]
  def change
    add_reference :recipes, :type, foreign_key: true
  end
end
