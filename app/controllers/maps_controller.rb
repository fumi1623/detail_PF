class MapsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @map.save
    redirect_to event_path(@event)
  end

  def edit
  end

  def update
  end

  def destroy
  end

    # ストロングパラメーター
  def map_params
    params.require(:map).permit(:name, :address, :latitude, :longitude)
  end

end
