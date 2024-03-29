class User < ApplicationRecord
  has_secure_password
  validates :first_name, :last_name, :email, :password, presence: true, length: { minimum: 5 }
  has_many :survey
end
