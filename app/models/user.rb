class User < ApplicationRecord
  has_one :party
  has_many :user_character
end
