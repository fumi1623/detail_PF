class GroupsController < ApplicationController
  def index
    # ログイン中のユーザーが所属するグループのみ抽出
    group_ids = current_user.group_users.pluck(:group_id)
    @groups = Group.where(id: group_ids).order(updated_at: :desc)
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      group_user = @group.group_users.new(user: current_user, invitation: true) # 作成したユーザーは招待済みにする
      group_user.save
      group_ids = current_user.group_users.pluck(:group_id)
      @groups = Group.where(id: group_ids).order(updated_at: :desc)
    else
      group_ids = current_user.group_users.pluck(:group_id)
      @groups = Group.where(id: group_ids).order(updated_at: :desc)
      render 'index'
    end
  end

  def show
    @group = Group.find_by_id(params[:id])
    if @group == nil  #存在しないIDなら一覧画面に飛ばす
      redirect_to groups_path
      return
    end
    true_group_users = @group.group_users.where(invitation: true)
    true_user_ids = true_group_users.pluck(:user_id)
    false_group_users = @group.group_users.where(invitation: false)
    false_user_ids = false_group_users.pluck(:user_id)
    if true_user_ids.include?(current_user.id)  #アクセス制限
      @users = User.where(id: true_user_ids)
      @events = Event.where(user_id: @users.ids, release: true)
      invitation_group_users = @group.group_users.where(invitation: false)
      invitation_user_ids = invitation_group_users.pluck(:user_id)
      @invitation_users = User.where(id: invitation_user_ids)
    elsif false_user_ids.include?(current_user.id)
      flash[:faile] = '招待を承認してください'
      redirect_to groups_path
    else
      flash[:faile] = 'グループに所属していません'
      redirect_to groups_path
    end
  end

  def edit
    @group = Group.find_by_id(params[:id])
    if @group == nil  #存在しないIDなら一覧画面に飛ばす
      redirect_to groups_path
      return
    end
    group_users = @group.group_users.where(invitation: true)
    user_ids = group_users.pluck(:user_id)
    if user_ids.include?(current_user.id)  #アクセス制限
      @new_group_user = GroupUser.new
    else
      flash[:faile] = 'グループに所属していません'
      redirect_to groups_path
    end
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to group_path(@group)
    else
      group = Group.find(params[:id])
      @group.name = group.name
      @new_group_user = GroupUser.new
      render 'edit'
    end
  end

  def delete_user
    @group = Group.find(params[:id])
    @group.update(group_params)
    redirect_to group_path(@group)
  end

  def day
    group = Group.find(params[:group_id])
    users = group.users
    events = Event.where(user_id: users.ids, release: true)
    # カレンダーからクリックされた日付を取得
    @day = Time.zone.parse(params[:day].to_s)
    # クリックされた日付の０時以降に終わるもの（まだ終わってないもの）であり、
    # ２４時以前に始まるもの（明日の０時より前に始まるもの）
    @events = events.where('end_time>=? and start_time<?', @day, @day.tomorrow).order(:start_time)
    # 前日から続いてるものと今日はじまるものを分ける
    @before_events = @events.where('start_time<?', @day).order(:start_time)
    @today_events = @events.where('start_time>=?', @day).order(:start_time)
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end
end
