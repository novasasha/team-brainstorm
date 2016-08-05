class User < ActiveRecord::Base
  include BCrypt

  has_many :games
  has_many :decks, through: :games
  has_many :guesses, through: :games

  validates :username, :email, :password_hash, presence: true

  validates :username, :email, uniqueness: true

end
