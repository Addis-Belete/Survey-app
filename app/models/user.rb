class User < ApplicationRecord
  validates :first_name, :last_name, :email, :password, :confirm_password, presence: true, length: { minimum: 5 }
end
