class Guess < ActiveRecord::Base
  belongs_to :card
  belongs_to :game
  has_one :user, through: :game

  validates :game_id, :card_id, :correct, presence: true
end
