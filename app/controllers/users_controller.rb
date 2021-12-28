class UsersController < ApplicationController
  def index
    render json: User.all
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def create
    @user = User.new(user_params)
    render json: @user if @user.save

    def update
      @user = User.find(params[:id])
      render json: @user if @user.update(user_params)
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
      render json: ("User succsfully Deleted")
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :confirm_password)
  end
end
