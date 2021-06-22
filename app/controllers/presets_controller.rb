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
    @preset = Preset.find(params[:id])
    if @preset.user == current_user  # アクセス制限
      @preset.destroy
      redirect_to new_event_path
    else
      redirect_to new_event_path
    end
  end

  private

  def preset_params
    params.require(:preset).permit(:user_id, :name, :detail, :remarks, :place, :release)
  end

end
