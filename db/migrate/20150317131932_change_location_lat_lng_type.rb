class ChangeLocationLatLngType < ActiveRecord::Migration
  def change
  	add_column :locations, :lat2, :decimal, :precision => 15, :scale => 12
  	add_column :locations, :lng2, :decimal, :precision => 15, :scale => 12
		
		execute "UPDATE locations SET lat2 = cast(lat as float)"
		execute "UPDATE locations SET lng2 = cast(lng as float)"

		remove_column :locations, :lat
		remove_column :locations, :lng

		rename_column :locations, :lat2, :lat
		rename_column :locations, :lng2, :lng
  end
end
