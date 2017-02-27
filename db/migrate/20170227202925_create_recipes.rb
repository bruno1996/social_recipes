class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :recipe_name
      t.string :kitchen
      t.string :type_of_food
      t.string :how_many_people_serves
      t.string :preparation_time
      t.string :difficulty_level
      t.string :ingredients
      t.string :step_by_step

      t.timestamps
    end
  end
end
