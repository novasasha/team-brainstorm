User.create(username: 'stevezhere', email: 'steve@steve.com', password_hash: 'abc123')
User.create(username: 'sasha', email: 'sasha@gmail.com', password_hash: '1234')

Deck.create(topic: 'Math')
Deck.create(topic: 'Animals')

Card.create(question: '1 + 1', answer: '2', deck_id: '1')
Card.create(question: '1 * 7', answer: '7', deck_id: '1')
Card.create(question: '4 + 4', answer: '8', deck_id: '1')

Card.create(question: 'How many legs has a dog?', answer: '4', deck_id: '2')
Card.create(question: 'What is a duck\'s favorite snack?', answer: 'Cheese and quackers', deck_id: '2')
Card.create(question: 'How would you describe a pig\'s tail', answer: 'curly', deck_id: '2')


