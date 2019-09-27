class PricesController < ApplicationController
  layout "nonavbar"

  def index
    @price = Price.new
   @prices = Price.all
  end

  def new
    @price = current_user.prices.build
  end

  def create
    @price = current_user.prices.build(prices_params)
    if @price.save
      redirect_to prices_path, notice: "Un nouveau prix a été ajouté"
    else
      render :new, notice: "Quelque chose ne va pas"
    end
  end

  def edit
    @price = Price.find(params[:id])
  end

  def update
    price = Price.find(params[:id])

    if price.update(prices_params)
      flash[:notice] = "Prix mis à jour"
    else
      flash[:notice] = "Problème"
    end
    redirect_to prices_path
  end

  def destroy
    @price = Price.find(params[:id])
    @price.destroy

    @prices = Price.all

    respond_to do |format|
      format.js
    end
  end

  private

  def prices_params
    params.require(:price).permit(
      :price,
      :duration,
      :description
    )
  end
end
