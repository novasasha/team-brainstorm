post "/games/:game_id/guesses" do
  card = Card.find(params[:card_id])
  guess = Guess.create(content: params[:guess], game_id: params[:game_id], card_id: params[:card_id], correct: card.check_card(params[:guess]))
  redirect "/decks/#{card.deck.id}/cards"
end

get "/games/:deck_id" do
  @game = Game.create(user_id: session[:user_id], deck_id: params[:deck_id])
  @deck = Deck.find(params[:deck_id])
  @cards = Card.where(deck_id: params[:deck_id])
  # @cards.each do |card|
  #   Guess.create(game_id: @game.id, card_id: card.id, correct: 0)
  # end
  erb :'gameplay/begin'
end
