require 'pry'
class SeasController < ApplicationController
  #define your controller actions here

  def welcome

  end

  def index
    @seas = Sea.all
  end

  def new
    @sea = Sea.new
  end

  def create
    @sea = Sea.create(sea_params)
    redirect_to seas_path
  end

  def show
    @sea = Sea.find_by(id: params[:id])
  end

  def edit
    @sea = Sea.find_by(id: params[:id])
  end

  def update
    @sea = Sea.find_by(id: params[:id])
    params.delete("_method")
    params[:has_mermaids] ||= false
    @sea.update(sea_params)
    redirect_to sea_path
  end

  def destroy
    @sea = Sea.find_by(id: params[:id])
    @sea.destroy
    redirect_to seas_path
  end


  private
  # In controller actions, use this private method to access sea params from forms.
  # Example: @sea.update(sea_params)
  # check the return value of sea_params to see what you're working with!
  def sea_params
    params.require(:sea).permit(:name, :temperature, :bio, :mood, :image_url, :favorite_color, :scariest_creature, :has_mermaids)
  end

end
