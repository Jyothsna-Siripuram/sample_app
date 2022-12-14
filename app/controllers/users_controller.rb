class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      p "#{@user.name} created successfully!"
      flash[:success] = "Hi #{@user.name}, Welcome to the Sample App!"
      redirect_to @user
    else
      p "#{@user.errors.full_messages}"
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end
  
  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
