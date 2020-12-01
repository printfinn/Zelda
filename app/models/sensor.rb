class Sensor < ApplicationRecord
  validates :name, presence: true
  validates :token, presence: true

  def valid_token?(params_token: nil)
    token == params_token
  end
end
