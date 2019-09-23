class CoachsController < ApplicationController
  layout 'nonavbar'

  def index
    @coach = Coach.new
    @coachs = Coach.all
  end

  def new
    @coach = current_user.coachs.build
  end

  def create
    @coach = current_user.coachs.build(coach_params)
    if @coach.save
      redirect_to coachs_path, notice: "Un nouveau coach a été ajouté"
    else
      render :new, notice: "Quelque chose ne va pas"
    end
  end

  def edit
    @coach= Coach.find(params[:id])
  end

  def update
    coach = Coach.find(params[:id])
    coach.picture.file.delete

    if coach.update(coach_params)
      flash[:notice] = "modification enregistrée"
    else
      flash[:notice] = "Problème"
    end
    redirect_back(fallback_location: request.referer)
  end

  def destroy
    @coach = Coach.find(params[:id])
    @coach.destroy

    @coachs = Coach.all

    respond_to do |format|
      format.js
    end
  end

  private

  def coach_params
    params.require(:coach).permit(
      :name,
      :specialisation,
      :picture
    )
  end

end
