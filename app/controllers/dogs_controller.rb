class DogsController < ApplicationController
  before_action :set_dog, only: [:show]
  skip_before_action :authenticate_user!, only: :index

  def index
    @dogs = Dog.all

    # @markers = @dogs.geocoded.map do |dog|
    #   {
    #     lat: dog.latitude,
    #     lng: dog.longitude
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
    params.require(:dog).permit(:name, :breed, :age)
  end

  def set_dog
    @dog = Dog.find(params[:id])
  end
end
