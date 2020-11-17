class DogsController < ApplicationController
before_action :set_dog, only: [:show]

  def show    
  end
  
  def index
    @dogs = Dog.all
    @search = params["postcode"]
  end
  
  private

  def set_dog
    @dog = Dog.find(params[:id])
  end

end
