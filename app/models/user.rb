class User < ActiveRecord::Base
  include BCrypt

  has_many :games
  has_many :decks, through: :games
  has_many :guesses, through: :games

  validates :username, :email, :password_hash, presence: true

  validates :username, :email, uniqueness: true

  # users.password_hash in the database is a :string
  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(password)
    self.password == password
  end
end
