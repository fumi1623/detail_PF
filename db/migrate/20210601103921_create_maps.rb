class CreateMaps < ActiveRecord::Migration[5.2]
  def change
    create_table :maps do |t|
      t.integer :event_id
      t.string :name
      t.text :address
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end
