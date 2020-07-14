class Card
  attr_reader :question, :answer, :category

  def initialize(question, answer, category)
    @question = question
    @answer = answer
    @category = category
  end

  def ==(other)
    self.question == other.question &&
    self.answer == other.answer &&
    self.category == other.category
  end
end
