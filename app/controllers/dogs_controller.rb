class DogsController < ApplicationController
  before_action :set_dog, only: [:show]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @dogs = Dog.all

    users = []
    @dogs.each do |dog|
      users << dog.user
    end

    # @markers = users.geocoded.map do |user|
    #   {
    #     lat: user.latitude,
    #     lng: user.longitude
    #   }
    # end
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
    params.require(:dog).permit(:name, :breed, :age, :photo)
  end

  def set_dog
    @dog = Dog.find(params[:id])
  end
end
