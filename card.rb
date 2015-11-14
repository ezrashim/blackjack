class Card
  attr_accessor :suit, :value
  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def type
    if @value == 'A'
      return "ace"
    elsif (@value == 'J') || (@value == 'Q') || (@value == 'K')
      return "face card"
    else
      return "number card"
    end
  end
end
