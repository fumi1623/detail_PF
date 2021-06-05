class EventsController < ApplicationController
  def index
    # @events = Event.where(user_id: current_user.id).order(:start_time)
    @events = current_user.events.order(:start_time)
    # group_ids = GroupUser.where(user_id: current_user.id).pluck(:group_id)
    group_ids = current_user.group_users.pluck(:group_id)
    @groups = Group.where(id: group_ids)
  end

  def day
    user_events = Event.where(user_id: current_user.id)
    @events = user_events.where(start_time: format)
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


  # def group_user_params
  #   params.require(:group_user).permit(:user_id, :group_id)
  # end

end