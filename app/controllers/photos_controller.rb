class PhotosController < ApplicationController

  def create
    @course = Course.find(params[:course_id])

    if params[:images]
      params[:images].each do |img|
        @course.photos.create(image: img)
      end

      @photos = @course.photos
      redirect_back(fallback_location: request.referer, notice: "Saved...")
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @course = @photo.course

    @photo.destroy
    @photos = Photo.where(course_id: @course.id)

    respond_to do |format|
      format.js
    end
  end
end
