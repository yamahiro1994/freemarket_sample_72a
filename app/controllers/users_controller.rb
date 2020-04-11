class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.create(user_params)
    # @user.password_confomation = user.params[:password]
    if @user.save
      redirect_to root_path
    else
      render "new"
    end
  end  

  private

  def user_params
    params.require(:user).permit(:nickname,:email,:password,:password_confirmation,:family_name,:family_name_kana,:user_name,:user_name_kana,:birthday, :destination_family_name, :destination_family_name_kana, :destination_name, :destination_name_kana, :postal_code, :prefectures, :municipality, :address, :apartment_room_namber, :phone_number)
  end
  
end
