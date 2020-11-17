class DogsController < ApplicationController

  def new
    @dog = Dog.new
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
end
