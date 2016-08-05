get "/decks/:deck_id/cards" do
  @deck = Deck.find(params[:deck_id])
  @cards = Card.where(deck_id: params[:deck_id])
  @game = Game.create(user_id: session[:user_id], deck_id: params[:deck_id])
  @cards.each do |card|
    Guess.create(game_id: @game.id, card_id: card.id, correct: 0)
  end
  if @deck.get_card
    @current_card = @deck.get_card
    redirect :"/decks/#{params[:deck_id]}/cards/#{@current_card.id}"
  else
    erb :'index'
  end
end

get "/decks/:deck_id/cards/:id" do
  @topic = Deck.find(params[:deck_id]).topic
  @question = Card.find(params[:id]).question
 erb :'gameplay/cards'
end
