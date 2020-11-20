class DogsController < ApplicationController
  before_action :set_dog, only: [:show]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    # If search find users within 10 miles
    if params[:query].present?
      @dogs = []
      # @dogs = Dog.joins(:user).where(users: { address: params[:query] })
      users = User.near(params[:query], 10)
      # Adding their dogs to @dogs
      users.each do |user|
        user.dogs.each { |dog| @dogs << dog }
      end
      # Finding users with dogs
      users = users.reject { |user| user.dogs == [] }

      @markers = users.map do |u|
        {
          lat: u.latitude,
          lng: u.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { user: u })
        }
      end
    else
      # if not search then showing all dogs
      @dogs = Dog.all
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

  private

  def dog_params
    params.require(:dog).permit(:name, :breed, :age, :photo, :hourly_rate)
  end

  def set_dog
    @dog = Dog.find(params[:id])
  end
end
