class Deck < ActiveRecord::Base
  has_many :cards
  has_many :games
  has_many :users, through: :games

  validates :topic, presence: true

  def get_card(game_id)
    cards_left = self.cards.to_a
    cards_left.delete_if do |card|
      card.get_guesses(game_id).include?(1)
    end
    cards_left.sample
  end

  def card_ids
    all_cards = Card.where(deck_id: self.id)
    ids =[]
      all_cards.each do |card|
        ids << card.id
      end
    ids
  end

end
