class EventsController < ApplicationController

  def index
    @events = current_user.events.order(:start_time)
    event_ids = @events.pluck(:id)  #ユーザーの持つイベントのTagを抽出
    tag_relationships_tag_ids = TagRelationship.where(event_id: event_ids).pluck(:tag_id)
    @tags = Tag.where(id: tag_relationships_tag_ids)  #ここまでTagの記述
    @true_group_users = current_user.group_users.where(invitation: true)  #所属グループ
    @false_group_users = current_user.group_users.where(invitation: false)  #招待を受けているグループ
    @today_events = @events.where("end_time>=? and start_time<?", Date.today, Date.tomorrow).order(:start_time)
  end

  def day
    user_events = Event.where(user_id: current_user.id)
    @day = Time.zone.parse("#{params[:day]}")
    @events = user_events.where("end_time>=? and start_time<?", @day, @day.tomorrow)
    @before_events = @events.where("start_time<?", @day).order(:start_time)
    @today_events = @events.where("start_time>=?", @day).order(:start_time)
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    tag_list = params[:event][:tag_ids].split(',')
    if @event.save
      @event.save_tags(tag_list)
      redirect_to events_path
    else
      render "new"
    end
  end

  def show
    @event = Event.find(params[:id])
    @map = Map.new
    @maps =Map.where(event_id: @event.id)
    @map_pin = @maps.first
    @image = Image.new
  end

  def edit
    @event = Event.find(params[:id])
    @tag_list = @event.tags.pluck(:name).join(",")
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      if params[:event][:tag_ids].present?
        tag_list = params[:event][:tag_ids].split(",")
        @event.save_tags(tag_list)
      end
      redirect_to event_path(@event)
    else
      render "edit"
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end

  def tag
    @tag = Tag.find(params[:id])
    tag_relationships_event_ids = TagRelationship.where(tag_id: @tag.id).pluck(:event_id)
    @events = current_user.events.where(id: tag_relationships_event_ids)
  end

  private

  def event_params
    params.require(:event).permit(:user_id, :name, :detail, :remarks, :start_time, :end_time, :place, :release, images_images: [])
  end

end
