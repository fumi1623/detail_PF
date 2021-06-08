class EventsController < ApplicationController

  def index
    @events = current_user.events.order(:start_time)
    @true_group_users = current_user.group_users.where(invitation: true)
    @false_group_users = current_user.group_users.where(invitation: false)
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
    @event.save
    redirect_to events_path
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
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    redirect_to event_path(@event)
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(:user_id, :name, :detail, :remarks, :start_time, :end_time, :place, :release, images_images: [])
  end


  # def group_user_params
  #   params.require(:group_user).permit(:user_id, :group_id)
  # end

end