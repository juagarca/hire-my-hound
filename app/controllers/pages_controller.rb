class PagesController < ApplicationController
skip_before_action :authenticate_user!, only: [:home, :blog]
  def home
  end

  def blog
  end
end
