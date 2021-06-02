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
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def event_params
    params.require(:event).permit(:user_id, :name, :detail, :remarks, :start_time, :end_time, :place, :release)
  end

end