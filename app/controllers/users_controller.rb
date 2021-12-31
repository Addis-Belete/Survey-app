class UsersController < ApplicationController
  def index
    render json: { status: "SUCCESS", message: "Loaded users", data: User.all }
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def create
    @user = User.create!(user_params)

    render json: { status: "SUCCESS", message: "user created successfully", data: @user }, status: :created
  end

  def update
    @user = User.find(params[:id])
    render json: @user if @user.update(user_params)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    render json: { status: "SUCCESS", message: "User successfully deleted", data: @user }, status: :ok
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :confirm_password)
  end
end
