class MapsController < ApplicationController
  def create
    event = Event.find(params[:event_id])
    map = event.maps.new(map_params)
    map.event_id = event.id
    if map.save
      flash[:success] = "ピンが登録されました"
      redirect_to event_path(event)
    else
      flash[:danger] = "ピンが登録できませんでした"
      redirect_to event_path(event)
    end
  end

  def edit
  end

  def update
  end

  def destroy
    map = Map.find(params[:event_id])
    event = map.event
    map.destroy
    redirect_to event_path(event)
  end

    # ストロングパラメーター
  def map_params
    params.require(:map).permit(:name, :address, :latitude, :longitude)
  end

end
