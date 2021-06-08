class GroupUsersController < ApplicationController

  def create
    @new_group_user = GroupUser.new(group_user_params)
    @new_group_user.save
    @group = Group.find(params[:group_user][:group_id])
    redirect_to group_path(@group)
  end

  def destroy
    group_user = GroupUser.find_by(user_id: group_user_params[:user_id], group_id: params[:id])
    group = Group.find(params[:id])
    group_user.destroy
    redirect_to group_path(group)
  end

  def accept
    group_user = GroupUser.find(params[:id])
    group_user.update(group_user_params)
    group = group_user.group
    redirect_to group_path(group)
  end

  def reject
    group_user = GroupUser.find(params[:id])
    group_user.destroy
    redirect_to events_path
  end

  private
  def group_user_params
    params.require(:group_user).permit(:user_id, :group_id, :invitation)
  end

end
