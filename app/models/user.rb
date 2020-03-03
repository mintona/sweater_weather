class User < ApplicationRecord
  before_create :set_api_key

  validates :email, uniqueness: true, presence: true
  validates_presence_of :password, require: true
  validates_presence_of :password_confirmation, require: true
  validates :api_key, uniqueness: true, presence: false

  has_secure_password

  def set_api_key
    self.api_key = generate_api_key
  end
end
