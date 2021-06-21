class MapsController < ApplicationController
  def create
    event = Event.find(params[:event_id])
    map = event.maps.new(map_params)
    map.event_id = event.id
    if map.save
      flash[:success] = 'ピンが登録されました'
    else
      flash[:danger] = 'ピンが登録できませんでした'
    end
    redirect_to event_path(event)
  end

  def destroy
    map = Map.find(params[:event_id])
    event = map.event
    map.destroy
    redirect_to event_path(event)
  end

  def map_params
    params.require(:map).permit(:name, :address, :latitude, :longitude)
  end
end
