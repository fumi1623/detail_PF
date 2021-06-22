class PresetsController < ApplicationController

  def new
    @preset = Preset.new
  end

  def create
    @preset = Preset.new(preset_params)
    @preset.user_id = current_user.id
    @preset.save
    redirect_to new_event_path
  end

  def destroy
  end

  private

  def preset_params
    params.require(:preset).permit(:user_id, :name, :detail, :remarks, :place, :release)
  end

end
