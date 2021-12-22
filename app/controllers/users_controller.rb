class UsersController < ApplicationController
  def index
    json_response(@user.all)
  end

  def show
    @user = User.find(params[:id])
    json_response(@user)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      json_response(@user, :created)
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :confirm_password)
  end
end
