class SeasController < ApplicationController
  #define your controller actions here
  def welcome
  end

  def index
    @seas = Sea.all
  end

  def create
    new_sea = Sea.create(sea_params)
    # redirect_to sea_path(new_sea)
    redirect_to new_sea
    # redirect_to :"/seas/#{new_sea.id}" <-not the rails way
  end

  def new
    @sea = Sea.new
  end

  def edit 
    @sea = Sea.find(params[:id])
  end

  def show 
    @sea = Sea.find(params[:id])
  end
 
  def update
    @sea = Sea.find(params[:id])
    @sea.update(sea_params)
    redirect_to @sea
  end

  def delete
    @sea = Sea.find(params[:id])
    @sea.destroy
  end
  # patch "/seas/:id" do
  #   @sea = Sea.find(params[:id])
  #   params.delete("_method")
  #   params[:has_mermaids] ||= false
  #   @sea.update(params)
  #   redirect to "/seas/#{@sea.id}"
  # end



  private #<----fcuk yiu
  # In controller actions, use this private method to access sea params from forms.
  # Example: @sea.update(sea_params)
  # check the return value of sea_params to see what you're working with!
  def sea_params
    params.require(:sea).permit(:name, :temperature, :bio, :mood, :image_url, :favorite_color, :scariest_creature, :has_mermaids)
  end

end