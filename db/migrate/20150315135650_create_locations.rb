class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.references :user
      t.string :name
      t.string :lng
      t.string :lat
      t.string :pic
      t.text :message

      t.timestamps null: false
    end
    add_index :locations, :lng
    add_index :locations, :lat
  end
end
