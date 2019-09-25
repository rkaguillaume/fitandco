class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :courses]

  def home
  end

  def courses
    @coachs = Coach.all.size
    @courses = Course.all
  end
end
