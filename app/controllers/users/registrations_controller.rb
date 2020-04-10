# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   @user = User.new
  # end

  # def create
  #   @user = User.new(user_params)
  #   if @user.save
  #     redirect_to root_path
  #   #   flash[:notice] = "新規登録が完了しました"
  #   # else
  #   #   flash[:alert] = "登録に失敗しました"
  #   end
  # end  
  # POST /resource
  # def birthday_join
  #   year = params[:user]["birthday(1i)"]
  #   month = params[:user]["birthday(2i)"]
  #   day = params[:user]["birthday(3i)"]
  #   birthday = year.to_s + "-" + month.to_s + "-" + day.to_s
  #   return birthday
  # end
  
  private

  def user_params
    params.require(:user).permit(:nickname,:email,:password,:family_name,:family_name_kana,:user_name,:user_name_kana,:birthday, :destination_family_name, :destination_family_name_kana, :destination_name, :destination_name_kana, :postal_code, :prefectures, :municipality, :address, :apartment_room_namber, :phone_number)
  end

  # def birthday_join

  #   date = params[:user][:birthday]

  #   Date.new date["birthday(1i)"].to_i,date["birthday(2i)"].to_i,date["birthday(3i)"].to_i
  # end  
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
