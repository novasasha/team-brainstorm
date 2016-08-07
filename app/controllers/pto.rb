get '/pto' do 


	nypost_doc = Nokogiri::HTML(open("http://nypost.com/"))

	nypost = []
	nypost_doc.xpath('//h3').each do |node|
		nypost << node.text
	end

	encoding_options = {
	    :invalid           => :replace,  # Replace invalid byte sequences
	    :undef             => :replace,  # Replace anything not defined in ASCII
	    :replace           => '',        # Use a blank for those replacements
	    :universal_newline => true       # Always break lines with \n
	  }

	nytimes_doc = Nokogiri::HTML(open("http://nytimes.com/"))

	nytimes = []
	nytimes_doc.css('h2.story-heading').each do |node|
		nytimes << node.text.strip.encode(Encoding.find('ASCII'), encoding_options)
	end



	onion_doc = Nokogiri::HTML(open("http://www.theonion.com/"))

	onion = []
	onion_doc.css('.headline').each do |node|
		onion << node.text.strip
	end

	@deck = Deck.create(topic: "Post, Times or Onion")
	@game = Game.create(user_id: session[:user_id], deck_id: @deck.id)

	nypost.sample(1).each do |headline|
		Card.create(deck_id: @deck.id, question: headline, answer: "post")
	end

	nytimes.sample(1).each do |headline|
		Card.create(deck_id: @deck.id, question: headline, answer: "times")
	end

	onion.sample(1).each do |headline|
		Card.create(deck_id: @deck.id, question: headline, answer: "onion")
	end

	erb :"gameplay/begin"
end