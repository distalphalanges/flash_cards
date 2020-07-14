require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/card_generator'

class CardGeneratorTest < Minitest::Test
  def test_it_generates_cards
    file_path = "./test/cards.txt"

    card1 = Card.new("By what name is the island of Rapa Nui better known?", "Easter Island", "Geography")
    card2 = Card.new("What American group released the landmark 1966 album 'Pet Sounds'?", "The Beach Boys", "Entertainment")
    card3 = Card.new("What country gave the Statue of Liberty to the US?", "France", "History")

    cards = CardGenerator.new(file_path).cards

    assert_equal [card1, card2, card3], cards
  end
end
