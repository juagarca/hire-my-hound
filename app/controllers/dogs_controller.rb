class DogsController < ApplicationController
  before_action :set_dog, only: [:show]
  
  def index
    @dogs = Dog.all
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

  def set_dog
    @dog = Dog.find(params[:id])
  end
end
