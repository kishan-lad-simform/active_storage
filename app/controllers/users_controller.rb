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
      redirect_to root_path
    else
      render :new, status: 422
    end
  end

  def show 
    find_user
  end

  def destroy
    find_user
    @user.avatar.purge
    @user.destroy
    redirect_to root_path
  end

  private
    def user_params
      params.require(:user).permit( 
        :name, 
        :avatar, 
        :email,
        :contact )
    end

    def find_user
      @user = User.find(params[:id])
    end
end
