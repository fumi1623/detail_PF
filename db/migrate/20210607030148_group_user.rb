class GroupUser < ActiveRecord::Migration[5.2]
  def change
    change_column_default :group_users, :invitation, default: false
  end
end
