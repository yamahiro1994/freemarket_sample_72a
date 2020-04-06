class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create]

  def buy
    @image = Image.find(@item.id).image
    @seller = User.find(@item.seller_id)
  end
  
  def index
    @items = Item.all
    @item = Item.find(1)
    @image = Image.find(@item.id).image
  end

  def show
    @items = Item.all
    @images = @item.images
    @image = Image.find(@item.id).image
    @seller = User.find(@item.seller_id)
  end

  def destroy
    @item.destroy
  end

 private
  def set_item
    @item = Item.find(params[:id])
  end
end
