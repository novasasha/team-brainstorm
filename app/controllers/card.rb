get "/decks/:deck_id/cards" do
  @deck = Deck.find(params[:deck_id])
  @cards = Card.where(deck_id: params[:deck_id])

  @cards.each do |card|
    redirect :"/decks/#{params[:deck_id]}/cards/#{card.id}"
  end
end

get "/decks/:deck_id/cards/:id" do
  @topic = Deck.find(params[:deck_id]).topic
  @question = Card.find(params[:id]).question
 erb :'gameplay/cards'
end
