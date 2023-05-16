class UsersController < ApplicationController
  before_action :find_user, only: [ :show, :destroy ]
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

  def show ; end

  def destroy
    @user.avatar.purge
    if @user.destroy
      flash[:success] = "User deleted successfully."
      redirect_to root_path
    else
      flash.now[:alert] = "User not deleted"
      render :index, status: 422
    end
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
