class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates_presence_of :password, require: true
  validates_presence_of :password_confirmation, require: true
  validates :api_key, uniqueness: true, presence: false

  has_secure_password
  has_secure_token :api_key
end
