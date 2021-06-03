class EventsController < ApplicationController
  def index
    @events = Event.where(user_id: current_user.id)
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

end