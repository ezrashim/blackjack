require_relative 'deck'

class Hand
  attr_accessor :hand, :score
  def initialize
    @hand = []
    @score = 0
  end

    def deal(num)
      num.times do |item|
        @hand << Deck.new.cards.pop
      end
      @hand
    end

  def calculate_hand
    @score = 0
    @hand.each do |card|
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
