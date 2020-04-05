sclass ItemsController < ApplicationController

  def buy
  end
  
  def index
  end
  
  def new  
    @item = Item.new
    @item.images.new
  end

  def create
    @items = Item.all
    @item = Item.find(1)
    @image = Image.find(@item.id).image

    @item = Item.new(item_params)
    if @item.save!
      redirect_to root_path
    else
      render :new
    end

  end

  def show
    @items = Item.all
    @item = Item.find(params[:id])
    @images = @item.images
    @image = Image.find(@item.id).image
    @seller = User.find(@item.seller_id)
  end

  private

  def item_params
    params.require(:item).permit(:title, :content, :price, :status, :delivery_origin, :delivery_days, :delivery_charge, :category_id, :delivery_method, :seller_id, images_attributes: [:image])
  end

end
