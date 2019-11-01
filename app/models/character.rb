class Character < ApplicationRecord
  belongs_to :party, optional: true
  has_many :users, through: :user_character
  has_many :user_character
  has_many :character_ranking
  has_many :rankings, through: :character_rankings, source: :ranking
end
