class CreatePresets < ActiveRecord::Migration[5.2]
  def change
    create_table :presets do |t|
      t.integer :user_id
      t.string :name
      t.text :detail
      t.text :remarks
      t.string :place
      t.boolean :release

      t.timestamps
    end
  end
end
