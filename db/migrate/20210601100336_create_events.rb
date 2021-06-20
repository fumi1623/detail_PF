class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.integer :user_id
      t.string :name
      t.text :detail
      t.text :remarks
      t.datetime :start_time
      t.datetime :end_time
      t.string :place
      t.boolean :release

      t.timestamps
    end
  end
end
