class ItemsController < ApplicationController

  def buy
  end
  
  def index
    @items = Item.where("buyer_id != status is null").order(id: :desc)
    @images = Image.includes(:item)
  end

  def show
    @items = Item.all
    @item = Item.find(params[:id])
    @images = @item.images
    @image = Image.find(@item.id).image
    @seller = User.find(@item.seller_id)
  end

end
