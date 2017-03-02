class CreateKitchens < ActiveRecord::Migration[5.0]
  def change
    create_table :kitchens do |t|
      t.string :name

      t.timestamps
    end
  end
end
