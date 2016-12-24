class PropsController < ApplicationController
  before_action :find_prop, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :same_user, only: [:edit, :delete]

  def index
      @q = Prop.search(params[:q])
    if params[:category].blank?
      @props = @q.result.sorted.page(params[:page]).per_page(7)
    else      
      @category_id = Category.find_by(name: params[:category]).id
      @props = @q.result.where(category_id: @category_id).sorted.page(params[:page]).per_page(7)
    end
  end

  def show 
    if signed_in?    
      @new_comment = Comment.build_from(@prop, current_user.id, "")
    end
  end

  def new
    @prop = current_user.props.build
  end

  def create
    @prop = current_user.props.build(prop_params)
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
      params.require(:prop).permit(:name, :phone, :area, :address, :url, :bhk, :price, :sqft, :category_id)
    end

    def same_user
      if current_user != @prop.user
        redirect_to new_user_session_path, alert: "You can edit or delete only your listing"
      end
    end
end
