class SessionsController < ApplicationController
  def signup
    @user = User.new(user_params)
    if @user.save
      token = encode_user_data({ user_data: user.id })
      render json: { token: token }
    else
      render json: { message: "Invalid credentials" }
    end
  end

  def login
    user = User.find_by(email: param[:email])
    if user && user.password == param[:password]
      token = encode_user_data({ user_data: user.id })
      render json: { token: token }
    else
      render json: { message: "Invalid credentials" }
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :confirm_password)
  end
end
