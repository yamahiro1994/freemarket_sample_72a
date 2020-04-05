class ItemsController < ApplicationController

  def buy
  end
  
  def index
  end
  
  def new  
    @item = Item.new
    @item.images.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:title, :content, :price, :status, :delivery_method, :delivery_origin, :delivery_days, :delivery_charge, :category_id, :seller_id, images_attributes:[:image])
  end

end
