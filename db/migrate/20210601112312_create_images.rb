class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|

      t.integer :event_id
      t.integer :image_id
      t.index ["event_id"], name: "index_images_on_event_id"
      t.timestamps
    end
  end
end