class GroupsController < ApplicationController

  def index
    @groups = Group.all.order(updated_at: :desc)
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.users << current_user
    @group.save
    redirect_to groups_path
  end

  def show
    @group = Group.find_by(id: params[:id])
    @users = @group.users
    @events = Event.where(user_id: @users.ids)
  end

  def edit
    @group = Group.find(params[:id])
    # @users = @group.users
  end

  def update
    @group = Group.find(params[:id])
    @group.update(group_params)
    redirect_to group_path(@group)
  end

  def delete_user
    @group = Group.find(params[:id])
    # @group.users >>
    @group.update(group_params)
    redirect_to group_path(@group)
  end

  def day
  end

  private
  def group_params
    params.require(:group).permit(:name)
  end

end
