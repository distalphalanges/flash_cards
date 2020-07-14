require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

class RoundTest < Minitest::Test
  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @deck = Deck.new([@card_1, @card_2, @card_3])
  end

  def test_it_exists
    round = Round.new(@deck)

    assert_instance_of Round, round
  end

  def test_it_has_a_deck
    # skip
    round = Round.new(@deck)

    assert_equal @deck, round.deck
  end

  def test_it_starts_with_no_turns
    # skip
    round = Round.new(@deck)

    assert_equal [], round.turns
  end

  def test_the_current_card_is_the_top_card
    # skip
    round = Round.new(@deck)

    assert_equal @card_1, round.current_card
  end

  def test_it_can_take_turns
    # skip
    round = Round.new(@deck)
    new_turn = round.take_turn("Juneau")
    
    assert_instance_of Turn, new_turn
    assert new_turn.correct?
  end

  def test_it_keeps_track_of_turns
    # skip
    round = Round.new(@deck)
    new_turn = round.take_turn("Juneau")

    assert_equal [new_turn], round.turns
  end

  def test_it_moves_on_to_the_next_card_after_a_turn_is_taken
    # skip
    round = Round.new(@deck)

    round.take_turn("Juneau")
    assert_equal @card_2, round.current_card

    round.take_turn("Venus")
    assert_equal @card_3, round.current_card
  end

  def test_it_keeps_track_of_correct_guesses
    # skip
    round = Round.new(@deck)

    round.take_turn("Juneau")
    assert_equal 1, round.number_correct

    round.take_turn("Mars")
    assert_equal 2, round.number_correct
  end

  def test_it_stores_previous_guesses
    # skip
    round = Round.new(@deck)

    round.take_turn("Juneau")
    round.take_turn("Venus")

    assert_equal 2, round.turns.count
    assert_equal "Incorrect.", round.turns.last.feedback
    assert_equal 1, round.number_correct
  end

  def test_it_can_count_correct_guess_by_category
    # skip
    round = Round.new(@deck)

    round.take_turn("Juneau")
    round.take_turn("Venus")

    assert_equal 1, round.number_correct_by_category(:Geography)
    assert_equal 0, round.number_correct_by_category(:STEM)
  end

  def test_it_can_calculate_correct_guesses_as_a_percentage
    # skip
    round = Round.new(@deck)

    round.take_turn("Juneau")
    round.take_turn("Venus")

    assert_equal 50.0, round.percent_correct
  end

  def test_it_can_calculate_correct_guesses_by_category_as_a_percentage
    # skip
    round = Round.new(@deck)

    round.take_turn("Juneau")
    round.take_turn("Venus")

    assert_equal 100.0, round.percent_correct_by_category(:Geography)
  end
end
