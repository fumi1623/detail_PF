class UsersController < ApplicationController
  def my_page
    @user = current_user
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to my_page_users_path
    else
      render :edit
    end
  end

  def quit; end

  def out
    user = current_user
    user.destroy
    redirect_to root_path
  end

  def user_params
    params.require(:user).permit(:name, :profile_image, :email)
  end
end
