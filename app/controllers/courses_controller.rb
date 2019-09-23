class CoursesController < ApplicationController
  layout 'nonavbar'

  def index
    @course = Course.new
    @courses = Course.all
  end

  def new
    @course = current_user.courses.build
  end

  def create
    @course = current_user.courses.build(courses_params)
    if @course.save
      redirect_to courses_path, notice: "Le cour a été ajoutée"
    else
      render :new, notice: "Quelque chose ne va pas"
    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    course = Course.find(params[:id])

    if course.update(courses_params)
      flash[:notice] = "modification enregistrée"
    else
      flash[:notice] = "Problème"
    end
    redirect_back(fallback_location: request.referer)
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy

    @courses = Course.all

    respond_to do |format|
      format.js
    end
  end

  def photo_upload
    @course = Course.find(params[:id])
    @photos = @course.photos
    @courses = current_user.courses
  end

  private

  def courses_params
    params.require(:course).permit(
      :title,
      :subtitle,
      :description
    )
  end
end
