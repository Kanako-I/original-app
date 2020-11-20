class UsersController < ApplicationController
  before_action :move_to_index

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to rooms_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end

  def move_to_index
    redirect_to root_path unless user_signed_in? 
  end
end
