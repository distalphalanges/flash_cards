class CardGenerator
  def initialize(file_path)
    @lines = File.open(file_path).readlines
  end

  def cards
    @lines.map { |line| card_from_line(line.chomp) }
  end

  private

  def card_from_line(line)
    Card.new(*line.split(','))
  end
end
