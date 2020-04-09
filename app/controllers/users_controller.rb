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
end
