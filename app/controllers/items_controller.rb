class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create]

  def buy
    @image = @item.images[0].image_url
    @seller = User.find(@item.seller_id)
    @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
    if @card.present?
      # 登録している場合,PAY.JPからカード情報を取得する
      # PAY.JPの秘密鍵をセットする。
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      # PAY.JPから顧客情報を取得する。
      customer = Payjp::Customer.retrieve(@card.customer_id)
      # PAY.JPの顧客情報から、デフォルトで使うクレジットカードを取得する。
      @card_info = customer.cards.retrieve(customer.default_card)
      # クレジットカード情報から表示させたい情報を定義する。
      # クレジットカードの画像を表示するために、カード会社を取得
      @card_brand = @card_info.brand
      # クレジットカードの有効期限を取得
      @exp_month = @card_info.exp_month.to_s
      @exp_year = @card_info.exp_year.to_s.slice(2,3) 

      # クレジットカード会社を取得したので、カード会社の画像をviewに表示させるため、ファイルを指定する。
      case @card_brand
      when "Visa"
        @card_image = "credit-visa.svg"
      when "JCB"
        @card_image = "credit-jcb.svg"
      when "MasterCard"
        @card_image = "credit-master-card.svg"
      when "American Express"
        @card_image = "credit-american_express.svg"
      when "Diners Club"
        @card_image = "credit-dinersclub.svg"
      when "Discover"
        @card_image = "credit-discover.svg"
      when "Saison"
        @card_image = "credit-saison-card.svg"
      end
    end
  end

  def pay
    @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
    if @item.buyer_id.present? 
      redirect_back(fallback_location: root_path) 
    elsif @card.blank?
      # カード情報がなければ、買えないから戻す
      redirect_to new_card_path
      flash[:alert] = '購入にはクレジットカード登録が必要です'
    else
      # 購入者もいないし、クレジットカードもあるし、決済処理に移行
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      # 請求を発行
      Payjp::Charge.create(
      amount: @item.price,
      customer: @card.customer_id,
      currency: 'jpy',
      )
      # 売り切れなので、productの情報をアップデートして売り切れにします。
      if @item.update(buyer_id: current_user.id)
        flash[:notice] = '購入しました。'
        redirect_to root_path
      else
        flash[:alert] = '購入に失敗しました。'
        redirect_to item_path(@item)
      end
    end
  end

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
