class ImagesController < ApplicationController

  def create
    event = Event.find(params[:event_id])
    image = Image.new(image_params)
    image.event_id = event.id
    image.save
    redirect_to event_path(event)
  end

  def destroy
    image = Image.find(params[:event_id])
    event = image.event
    image.destroy
    redirect_to event_path(event)
  end

  private

  def image_params
    params.require(:image).permit(:event_id, :image_id)
  end


end
