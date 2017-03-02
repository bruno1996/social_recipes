class RemoveKitchenFromRecipes < ActiveRecord::Migration[5.0]
  def change
    remove_column :recipes, :kitchen, :string
  end
end
