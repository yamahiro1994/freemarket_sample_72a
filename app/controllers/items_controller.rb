class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create]
  
  def buy
    @image = @item.images[0].image
    @seller = User.find(@item.seller_id)
  end
  
  def t_user_credit_detail
  end
  
  def t_user_credit_link
  end
  
  def t_user_logout
  end
  
  def t_user_show
  end
  
  def index
    @items = Item.where("buyer_id != status is null").order(id: :desc)
    @images = Image.includes(:item)
  end
  
  def new  
    @item = Item.new
    @item.images.new
    @address = Prefecture.all
    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end
  
  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end
  
    # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
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
    @image = @images[0].image
    @seller = User.find(@item.seller_id)
  end
  
  private
  
  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:title, :content, :price, :status, :prefecture_id, :delivery_days, :delivery_charge, :category_id, :delivery_method, :seller_id, images_attributes: [:image])
  end

end
