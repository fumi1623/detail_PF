class GroupUserInvitation < ActiveRecord::Migration[5.2]
  def change
    change_column_default :group_users, :invitation, from: true, to: false
  end
end
