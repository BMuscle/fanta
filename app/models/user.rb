class User < ApplicationRecord
  has_one :party
  has_many :characters, through: :user_character
  has_many :user_character
end
