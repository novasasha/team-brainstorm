get "/decks/:deck_id/cards" do
  @deck = Deck.find(params[:deck_id])
  @cards = Card.where(deck_id: params[:deck_id])
  @game_id = Game.all.last.id
  if @deck.get_card(@game_id)
    @current_card = @deck.get_card(@game_id)
    @current_card_id = @current_card.id
    @topic = @current_card.deck.topic
    @question = @current_card.question
    erb :"gameplay/cards"
  else
    erb :"users/stats"
  end
end

get "/decks/:deck_id/cards/:id" do
  @topic = Deck.find(params[:deck_id]).topic
  @question = Card.find(params[:id]).question
 erb :'gameplay/cards'
end
