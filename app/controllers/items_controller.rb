class ItemsController < ApplicationController

  def buy
  end
  
  def index
    @items = Item.all
    @images = Image.all
    # @item = Item.find(params[image:][:id])
    # @image = Image.find_by(@items_id).image
  end

  def show
    @items = Item.all
    @item = Item.find(params[:id])
    @images = @item.images
    @image = Image.find(@item.id).image
    @seller = User.find(@item.seller_id)
  end

end
