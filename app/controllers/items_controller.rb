class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create]
  
  def buy
    @image = @item.images[0].image
    @seller = User.find(@item.seller_id)
  end
  
  def index
    @items = Item.where("buyer_id != status is null").order(id: :desc)
    @images = Image.includes(:item)
  end
  
  def new  
    @item = Item.new
    @item.images.new
    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end
  
  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end
  
  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save!
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

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      redirect_to item_path
    end
  end

  def edit
  end

  def update
    if @item.update(product_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to root_path
  end

 private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:title, :content, :price, :status, :prefecture_id, :delivery_days, :delivery_charge, :category_id, :delivery_method, :seller_id, images_attributes: [:image, :_destroy, :id])
  end

end
