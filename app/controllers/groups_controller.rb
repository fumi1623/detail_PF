class GroupsController < ApplicationController

  def index
    @groups = Group.all.order(updated_at: :desc)
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.group_users << GroupUser.new({user: current_user, invitation: true})
    @group.save
    redirect_to groups_path
  end

  def show
    @group = Group.find_by(id: params[:id])
    group_users = @group.group_users.where(invitation: true)
    user_ids = group_users.pluck(:user_id)
    @users = User.where(id: user_ids)
    @events = Event.where(user_id: @users.ids, release: true)

    invitation_group_users = @group.group_users.where(invitation: false)
    invitation_user_ids = invitation_group_users.pluck(:user_id)
    @invitation_users = User.where(id: invitation_user_ids)
  end

  def edit
    @group = Group.find(params[:id])
    @new_group_user = GroupUser.new
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
    group = Group.find(params[:group_id])
    users = group.users
    events = Event.where(user_id: users.ids, release: true)
    # カレンダーからクリックされた日付を取得
    @day = Time.zone.parse("#{params[:day]}")
    # クリックされた日付の０時以降に終わるもの（まだ終わってないもの）であり、
    # ２４時以前に始まるもの（明日の０時より前に始まるもの）
    @events = events.where("end_time>=? and start_time<?", @day, @day.tomorrow).order(:start_time)
    # 前日から続いてるものと今日はじまるものを分ける
    @before_events = @events.where("start_time<?", @day).order(:start_time)
    @today_events = @events.where("start_time>=?", @day).order(:start_time)
  end

  private
  def group_params
    params.require(:group).permit(:name)
  end

end
