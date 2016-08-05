get "/decks" do
  @decks = Deck.all
  erb :'gameplay/deck'
end

get "/decks/:id" do
  redirect :'decks/params[:id]/cards/'
end
