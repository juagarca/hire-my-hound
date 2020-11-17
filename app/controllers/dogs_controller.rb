class DogsController < ApplicationController
before_action :set_dog, only: [:show]

  def show    
  end

  private

  def set_dog
    @dog = Dog.find(params[:id])
  end

  def index
    @dogs = Dog.all
  end
end
