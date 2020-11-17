class DogsController < ApplicationController
  def index
    @dogs = Dog.all
    @search = params["postcode"]
  end
end
