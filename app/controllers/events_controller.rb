class EventsController < ApplicationController

  before_action :tags

  def index
    @events = current_user.events.order(:start_time)
    @true_group_users = current_user.group_users.where(invitation: true) # 所属グループ
    @false_group_users = current_user.group_users.where(invitation: false) # 招待を受けているグループ
    @today_events = @events.where('end_time>=? and start_time<?', Date.today, Date.tomorrow).order(:start_time)
  end

  def day
    @day = Time.zone.parse(params[:day].to_s)
    user_events = Event.where(user_id: current_user.id)
    @events = user_events.where('end_time>=? and start_time<?', @day, @day.tomorrow)
    @before_events = @events.where('start_time<?', @day).order(:start_time) # 前日から続いてる予定
    @today_events = @events.where('start_time>=?', @day).order(:start_time) # 当日始まる予定
  end

  def new
    @event = Event.new
    @presets = current_user.presets
    gon.presets = @presets
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    tag_list = params[:event][:tag_ids].split(',') # 入力されたタグを,で区切って保存する
    if @event.save
      @event.save_tags(tag_list)
      flash[:success] = '予定が登録されました'
      redirect_to events_path
    else
      render 'new'
    end
  end

  def show
    # current.userが持つgroup_uerのgroup.idと@event.userの持つつgroup_uerのgroup.idに一致するものがあれば
    @event = Event.find_by_id(params[:id])
    if @event == nil  #存在しないIDなら一覧画面に飛ばす
      redirect_to '/events'
      return
    end
    c_group_ids = current_user.group_users.pluck(:group_id) # ログインユーザーの所属してるグループID
    e_group_ids = @event.user.group_users.pluck(:group_id) # イベントのユーザーの所属してるグループID
    group_match = c_group_ids & e_group_ids # 上２つの重複を探す
    # ログインユーザーと投稿ユーザーが一致 or (公開設定かつ同一のグループに所属している)
    if @event.user == current_user || (@event.release == true && group_match.empty? == false)
      @map = Map.new
      @maps = Map.where(event_id: @event.id)
      @map_pin = @maps.first
      @image = Image.new
    else
      redirect_to '/events'
    end
  end

  def edit
    @event = Event.find_by_id(params[:id])
    if @event == nil  #存在しないIDなら一覧画面に飛ばす
      redirect_to '/events'
      return
    end
    if @event.release == true  #公開設定のセレクトボックスの初期値用に1or0に変換
      @release = 1
    else
      @release = 0
    end
    @tag_list = @event.tags.pluck(:name).join(',')
    if @event.user == current_user # アクセス制限
      render 'edit'
    else
      redirect_to '/events'
    end
  end

  def update
    @event = Event.find(params[:id])
    # 画像の空投稿の場合、eventが渡ってこないので、そのままリダイレクト
    if params[:event].blank?
      flash[:danger] = '画像が登録できませんでした。'
      redirect_to event_path(@event)
      return
    end

    if @event.update(event_params)
      if params[:event][:tag_ids].present?
        tag_list = params[:event][:tag_ids].split(',')
        @event.save_tags(tag_list)
      end
      flash[:success] = '予定が更新されました'
      redirect_to event_path(@event)
    else
      render 'edit'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    if @event.user == current_user  # アクセス制限
      @event.destroy
      redirect_to events_path
    else
      redirect_to '/events'
    end
  end

  def tag
    @tag = Tag.find(params[:id])
    tag_relationships_event_ids = TagRelationship.where(tag_id: @tag.id).pluck(:event_id)
    @events = current_user.events.where(id: tag_relationships_event_ids)
  end

  private

  def event_params
    params.require(:event).permit(:user_id, :name, :detail, :remarks, :start_time, :end_time, :place, :release,
                                  images_images: [])
  end

  def tags
    @events = current_user.events.order(:start_time)
    event_ids = @events.pluck(:id)  # ユーザーの持つイベントのTagを抽出
    tag_relationships_tag_ids = TagRelationship.where(event_id: event_ids).pluck(:tag_id)
    @tags = Tag.where(id: tag_relationships_tag_ids) # ここまでTagの記述
  end

end
