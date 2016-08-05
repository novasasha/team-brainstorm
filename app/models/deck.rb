class Deck < ActiveRecord::Base
  has_many :cards
  has_many :games
  has_many :users, through: :games

  validates :topic, presence: true, uniqueness: true

  def get_card
    @cards_left = self.cards.to_a
    @cards_left.delete_if do |card|
      card.get_guesses.include?(1)
    end
    @cards_left.sample
  end
end
