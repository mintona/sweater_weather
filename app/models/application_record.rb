class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def generate_api_key
    SecureRandom.base58(27)
  end
end
