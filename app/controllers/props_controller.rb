class PropsController < ApplicationController
  before_action :find_prop, only: [:show, :edit, :update, :destroy]
  def index
    @props = Prop.all
  end

  def show    
  end

  def new
    @prop = Prop.new
  end

  def create
    @prop = Prop.new(prop_params)
    if @prop.save
      redirect_to @prop, notice: "Property listing successfully saved"
    else
      render 'new'
    end
  end

  def edit    
  end

  def update
    if @prop.update(prop_params)
      redirect_to @prop, notice: "successfully updated Property Listing"
    else
      render 'edit'
    end
  end

  def destroy
    @prop.destroy
    redirect_to root_path, notice: "Property Listing deleted successfully!"
  end

  private

    def find_prop
      @prop = Prop.find(params[:id])
    end

    def prop_params
      params.require(:prop).permit(:name, :phone, :area, :address, :url, :bhk, :price, :sqft)
    end
end
