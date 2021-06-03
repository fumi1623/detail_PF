class RemoveEventIdFromImages < ActiveRecord::Migration[5.2]
  def change
    remove_index :images, :event_id
  end
end
