class DogsController < ApplicationController

  def index
    @dogs = Dog.all
  end

   def show
    @dog = Dog.find(params[:id])
  end

  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.new(strong_params)
  end

  private
  def strong_params
    params.require(:dogs).allow(:name, :age, :breed, :insurance, :bio, :user_id)
  end
end
