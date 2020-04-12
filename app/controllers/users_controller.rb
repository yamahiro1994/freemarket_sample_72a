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

  def login
    @user = User.find_by!(name: params[:name], password: params[:password])
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
        redirect_to("/#{@user.id}")
    else
      redirect_to("/login")
    end
  end
end
