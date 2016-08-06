class Game < ActiveRecord::Base
  belongs_to :user
  belongs_to :deck
  has_many :guesses

  validates :user_id, :deck_id, presence: true

def first_guess
  all_cards = Card.where(deck_id)
  total_guesses = Guess.where(game_id: self.id, card_id: ).count
end
##find all guesses that belong to a card of a deck
  #if the card only has less than 2 guesses then it is first guess
end
