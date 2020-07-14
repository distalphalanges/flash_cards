class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    deck.cards[0]
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    deck.cards.shift
    turns << turn
    turn
  end

  def number_correct
    turns.count { |turn| turn.correct? }
  end

  def number_correct_by_category(category)
    turns_in_category(category).count { |turn| turn.correct? }
  end

  def percent_correct
    (number_correct.to_f / turns.count.to_f) * 100
  end

  def percent_correct_by_category(category)
    correct = number_correct_by_category(category)
    total = turns_in_category(category).count

    (correct.to_f / total.to_f) * 100
  end

  private

  def turns_in_category(category)
    turns_in_category = turns.select do |turn| 
      turn.card.category == category
    end
  end
end

