class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nickname
      t.string :avatar
      t.string :device_token
      t.string :device_os
      t.string :device_os_version

      t.timestamps null: false
    end
    add_index :users, :device_token
  end
end
