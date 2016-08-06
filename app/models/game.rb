class Game < ActiveRecord::Base
  belongs_to :user
  belongs_to :deck
  has_many :guesses

  validates :user_id, :deck_id, presence: true


  def first_guess
    counter = 0

    self.deck.card_ids.each do |card_id|
      if Guess.where("card_id = ? AND game_id = ?", "#{card_id}", "#{self.id}").count < 3
        counter += 1
      end
    end
    counter
  end



end
