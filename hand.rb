require_relative 'deck'

class Hand
  attr_accessor :cards, :score
  def initialize
    @cards = []
    @score = 0
  end

    def deal(num)
      num.times do |item|
        @cards << Deck.new.cards.pop
      end
      @cards
    end

  def calculate
    @score = 0
    @cards.each do |card|
        if card.type == "ace"
            if @score > 10
              @score += 1
            else
              @score += 11
            end
        elsif card.type =="face card"
          @score += 10
        else
          @score += card.value.to_i
        end
      end
        return @score

  end
end
