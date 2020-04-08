class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create]

  def buy
    @image = @item.images[0].image
    @seller = User.find(@item.seller_id)
  end
  
  # def t_user_credit_detail
  # end

  # def t_user_credit_link
  # end

  # def t_user_logout
  # end
  
  # def t_user_show
  # end

  def index
    @items = Item.all
    @images = Image.all
  end
  
  def new  
    @item = Item.new
    @item.images.new
    @address = Prefecture.all
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
    @items = Item.all
    @images = @item.images
    @image = @item.images[0].image_url
    @seller = User.find(@item.seller_id)
    @address = Prefecture.all
  end

 private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:title, :content, :price, :status, :prefecture_id, :delivery_days, :delivery_charge, :category_id, :delivery_method, :seller_id, images_attributes: [:image])
  end

end
