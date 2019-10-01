class LandingpicturesController < ApplicationController
  layout 'nonavbar'

  def index
    @picture = Landingpicture.new
    @pictures = Landingpicture.all
  end

  def new
    @picture = current_user.landingpictures.build
  end

  def create
   if params[:images]
        params[:images].each do |img|
          current_user.landingpictures.create(image: img)
        end
      end
     redirect_to landingpictures_path, notice: "La photo a été ajoutée"
  end

  def destroy
    @picture = Landingpicture.find(params[:id])
    @picture.destroy

    @pictures = Landingpicture.all

    respond_to do |format|
      format.js
    end
  end

end
