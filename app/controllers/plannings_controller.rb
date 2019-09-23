class PlanningsController < ApplicationController
  layout 'nonavbar'

  def index
    @planning = Planning.new
    @plannings = Planning.all
  end

  def new
    @planning = current_user.plannings.build
  end

  def create
    @planning = current_user.plannings.build(planning_params)
    if @planning.save
      redirect_to coachs_path, notice: "Un nouveau coach a été ajouté"
    else
      render :new, notice: "Quelque chose ne va pas"
    end
  end

  def edit
    @planning = Planning.find(params[:id])
  end

  def update
    planning = Planning.find(params[:id])
    if planning_params[:plan_img].present?
      planning.plan_img.file.delete
    end

    if planning.update(planning_params)
      flash[:notice] = "Planning mis à jours"
    else
      flash[:notice] = "Problème"
    end
      redirect_to plannings_path
  end

  def destroy
    @planning = Planning.find(params[:id])
    @planning.destroy

    @plannings = Planning.all

    respond_to do |format|
      format.js
    end
  end

  private

  def planning_params
    params.require(:planning).permit(
      :title,
      :plan_img
    )
  end

end
