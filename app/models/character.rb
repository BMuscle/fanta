class Character < ApplicationRecord
  belongs_to :party
  has_many :user_character
end
