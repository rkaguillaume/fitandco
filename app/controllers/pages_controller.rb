class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :courses, :coachs]

  def home
  end

  def courses
    @coachs = Coach.all.size
    @courses = Course.all
  end

  def coachs
    @coachs = Coach.all
  end
end
