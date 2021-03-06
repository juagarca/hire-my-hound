class DogsController < ApplicationController
  before_action :set_dog, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    # If params, search users within 10 miles
    if params[:query].present?
      @dogs = []
      users = User.near(params[:query], 10)
      # Finding users with dogs
      users = users.reject { |user| user.dogs == [] }
      # Adding their dogs to @dogs
      users.each do |user|
        user.dogs.each { |dog| @dogs << dog }
      end
    else
      @dogs = Dog.all
      users = User.all
      users = users.reject { |user| user.longitude.nil? || user.latitude.nil? || user.dogs == [] }
    end

    @markers = users.map do |u|
      {
        lat: u.latitude,
        lng: u.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { user: u })
      }
    end
  end

  def new
    @dog = Dog.new
  end

  def show
  end

  def create
    @dog = Dog.new(dog_params)
    @dog.user = current_user
    @dog.save
    redirect_to user_path(current_user)
  end

  def edit
  end

  def update
    @dog.update(dog_params)
    redirect_to user_path(current_user)
  end

  def destroy
    @dog.destroy
    redirect_to user_path(current_user)
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :breed, :age, :photo, :hourly_rate, :insurance, :bio)
  end

  def set_dog
    @dog = Dog.find(params[:id])
  end
end
