class ApplicationController < ActionController::API
  before_action :authorized
  SECRET = Rails.application.secrets.secret_key_base.to_s

  def encode_token(payload)
    JWT.encode(payload, SECRET)
  end

  def auth_header
    request.headers["Authorization"]
  end

  def decoded_token
    if auth_header
      token = auth_header.split(" ")[1]
      begin
        JWT.decode(token, SECRET, true, algorithm: "HS256")
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def logged_in?
    !!logged_in_user
  end

  def authorizes
    render json: { message: "Please log in" }, status: :unauthorized unless logged_in?
  end
end
