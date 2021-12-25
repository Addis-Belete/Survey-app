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
    json_response(@user, :created) if @user.save

    def update
      @user = User.find(params[:id])
      json_response(@user) if @user.update(user_params)
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
      json_response("User succsfully Deleted")
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :confirm_password)
  end
end
