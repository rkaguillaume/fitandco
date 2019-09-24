class DashboardsController < ApplicationController
  layout 'nonavbar'
  def index
    @coachs = Coach.all.size
    @courses = Course.all.size
    @plannings = Planning.all.size
  end
end
