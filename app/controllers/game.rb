post "/games/:game_id/guesses" do
  card = Card.find(params[:card_id])
  guess = Guess.create(content: params[:guess], game_id: params[:game_id], card_id: params[:card_id], correct: card.check_card(params[:guess]))
  redirect "/decks/#{card.deck.id}/cards"
end
