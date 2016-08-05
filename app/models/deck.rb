class Deck < ActiveRecord::Base
  has_many :cards
  has_many :games
  has_many :users, through: :games

  validates :topic, presence: true, uniqueness: true

end
