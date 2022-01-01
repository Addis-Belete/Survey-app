class ApplicationController < ActionController::API
  SECRET = "AddisBelete".freeze

  def authentication
    decode_data = decode_user_data(request.headers["token"])
    user_data = decode_data[0]["user_id"] if decode_data
    user = User.find(user_data&.id)

    if user
      true
    else
      render json: { message: "Invalid Credentials" }
    end
  end

  def encode_user_data(payload)
    JWT.encode payload, SECRET, "HS256"
  end

  def encode_user_data(payload)
    JWT.encode payload, SECRET, "HS256"
  end

  def decode_user_data(token)
    JWT.decode token, SECRET, true, { algorthim: "HS256" }
  rescue StandardError => e
    puts e
  end

  def decode_user_data(token)
    JWT.decode token, SECRET, true, { algorthim: "HS256" }
  rescue StandardError => e
    puts e
  end
end
