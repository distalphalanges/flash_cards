require './lib/card'
require './lib/card_generator'
require './lib/deck'
require './lib/turn'
require './lib/round'

cards = CardGenerator.new('./cards.txt').cards
deck = Deck.new(cards.shuffle)
round = Round.new(deck)
round.start
