class ItemsController < ApplicationController
  before_action :set_item, only: [:buy, :pay, :show, :edit, :update]

  def buy
    @image = @item.images[0].image
    @seller = User.find(@item.seller_id)
  end
  
  def index
    @items = Item.order(id: :desc)
    @images = Image.includes(:item)
    @parents = Category.where(ancestry: nil)
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
    @parents = Category.where(ancestry: nil)
  end

  def edit
    @items = Item.all
    @images = @item.images
    @image = @item.images[0].image_url
    @seller = User.find(@item.seller_id)
    @address = Prefecture.all
    grandchild_category = @item.category
    child_category = grandchild_category.parent
    @category_parent_array = []
    
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
    @category_children_array = []
    
    Category.where(ancestry: child_category.ancestry).each do |children|
      @category_children_array << children
    end
    
    @category_grandchildren_array = []
    Category.where(ancestry: grandchild_category.ancestry).each do |grandchildren|
      @category_grandchildren_array << grandchildren
    end
    
  end

  def update
    if @item.update(item_update_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:title, :content, :price, :status_id, :prefecture_id, :delivery_days_id, :delivery_charge_id, :category_id, :delivery_method_id, :seller_id, images_attributes: [:image, :_destroy, :id]).merge(seller_id: current_user.id)
  end

  def item_update_params
    params.require(:item).permit(:name,[images_attributes: [:image, :_destroy, :id]])
  end

end
