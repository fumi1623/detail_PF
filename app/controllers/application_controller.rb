class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top, :about]

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :gon_set

  def gon_set
    gon.presets = []
  end

  def after_sign_in_path_for(_resource)
    events_path # ログイン後に遷移するpathを設定
  end

  def after_sign_out_path_for(_resource)
    root_path # ログアウト後に遷移するpathを設定
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
