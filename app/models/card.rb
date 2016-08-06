class Card < ActiveRecord::Base
  # Remember to create a migration!'
  belongs_to :deck
  has_many :guesses

  def get_guesses(game_id)
    guesses = self.guesses
    guesses_2 = guesses.where(game_id: game_id).to_a
    guesses_2.map! do |guess|
      guess.correct
    end
    guesses_2
  end

  def check_card(guess)
    if self.answer == guess
      return 1
    else
      return 0
    end
  end
end
