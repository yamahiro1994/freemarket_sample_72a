class UsersController < ApplicationController
  before_action :set_category, except: [:index]

  def index
  end

  def create
    @user = User.create(user_params)
    if @user.save
      redirect_to root_path
    else
      flash[:notice] = '入力項目に不備があります'
      redirect_back(fallback_location: root_path)
    end
  end

  def show
    @items = Item.where(seller_id: current_user.id).order("created_at DESC")
    @images = Image.includes(:item)
    @user = User.find(params[:id])
    @bookmark_items = @user.bookmark_items.order("created_at DESC")
  end

  private
  def user_params
    params.require(:user).permit(:nickname,:email,:password,:password_confirmation,:family_name,:family_name_kana,:user_name,:user_name_kana,:birthday, :destination_family_name, :destination_family_name_kana, :destination_name, :destination_name_kana, :postal_code, :prefectures, :municipality, :address, :apartment_room_namber, :phone_number)
  end

  def set_category
    @parents = Category.where(ancestry: nil)
  end

end
