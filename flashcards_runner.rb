require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

cards = [
  Card.new("By what name is the island of Rapa Nui better known?",
           "Easter Island",
           "Geography"),
  Card.new("What is the capital of Iceland?",
           "Reykjavik",
           "Geography"),
  Card.new("What is the capital of Denmark?",
           "Copenhagen",
           "Geography"),
  Card.new("What is the make of the car used as a time machine in the movie 'Back to the Future'?",
           "DeLorean",
           "Entertainment"),
  Card.new("What American group released the landmark 1966 album 'Pet Sounds'?",
           "The Beach Boys",
           "Entertainment"),
  Card.new("Who was the voice of Darth Vader in the original Star Wars movie?",
           "James Earl Jones",
           "Entertainment"),
  Card.new("What 1980’s US president survived an assassination attempt?",
           "Ronald Reagan",
           "History"),
  Card.new("What country gave the Statue of Liberty to the US?",
           "France",
           "History"),
  Card.new("Which treaty organisation was set up as a counterpart to NATO?",
           "Warsaw Pact",
           "History"),
]

deck = Deck.new(cards.shuffle)
round = Round.new(deck)
round.start
