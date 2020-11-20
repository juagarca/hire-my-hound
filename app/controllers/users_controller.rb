class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def index
    @users = User.all
    @current_user = current_user
  end

  def show
    @bookings_other_dogs = current_user.bookings.where(user_id: current_user.id)
    @bookings_my_dogs = current_user.dogs.flat_map(&:bookings)    
  end

  def edit
  end

  def update
    raise
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :address, :bio, :email, :password, :photo)
  end
end
