class GroupUsersController < ApplicationController

  def create
    @new_group_user = GroupUser.new(group_user_params)
    @new_group_user.save
    @group = Group.find(params[:group_user][:group_id])
    redirect_to group_path(@group)
  end

  def destroy
    user = GroupUser.where(user.id = user_id)
    group = Group.find(params[:id])
    # group.users.delete(user)

  end

  private
  def group_user_params
    params.require(:group_user).permit(:user_id, :group_id)
  end
  def user_params
    params.require(:user).permit(:id)
  end

end
