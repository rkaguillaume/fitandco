class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :courses, :coachs, :plannings]

  def home
  end

  def courses
    @coachs = Coach.all.size
    @courses = Course.all
  end

  def coachs
    @coachs = Coach.all
  end

  def plannings
    @plannings = Planning.all
  end

  def subscriptions
    @prices = Price.all
  end
end
