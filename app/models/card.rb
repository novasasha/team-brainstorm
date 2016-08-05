class Card < ActiveRecord::Base
  # Remember to create a migration!'
  belongs_to :deck
  has_many :guesses

  def get_guesses
    guesses = self.guesses.to_a
    guesses.map! do |guess|
      guess.correct
    end
    guesses
  end
end
