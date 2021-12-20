class UsersController < ApplicationController
  def index
    json_response(@user.all)
  end

  def show
    @user = User.find(params[:id])
    json_response(@user)
  end

  def create
    @user = User.create!(user_params)
    json_response(@user, :created)
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :email, :password, :confirm_password)
  end
end
