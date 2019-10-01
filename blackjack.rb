require_relative 'card'
require_relative 'deck'
require_relative 'hand'
require_relative 'player'
require_relative 'dealer'


class Blackjack
  attr_accessor :player, :dealer, :deck
  def initialize
    @player = Player.new
    @dealer = Dealer.new
    @deck = Deck.new
  end

  def deal_player
    @player.hand.deal(1)
    puts "Player was dealt #{@player.hand.cards[-1].value}#{@player.hand.cards[-1].suit}"
  end

  def deal_dealer
    @dealer.hand.deal(1)
    puts "Dealer was dealt #{@dealer.hand.cards[-1].value}#{@dealer.hand.cards[-1].suit}"
  end

  def player_score
    puts "Player score: #{@player.hand.calculate}"
    return @player.hand.calculate
  end

  def dealer_score
     puts "Dealer score: #{@dealer.hand.calculate}"
      return @dealer.hand.calculate
  end

  def result
    if @player.hand.calculate > @dealer.hand.calculate
      puts "You win!"
      return "You win!"
    elsif @player.hand.calculate < @dealer.hand.calculate
      puts "Dealer wins!"
      return "Dealer wins!"
    else
      puts "Draw!"
      return "Draw!"
    end
  end

  def play!
    puts "Welcome to Blackjack!"
    puts ""
    deal_player
    deal_player
    player_score
    puts ""

    while true
      puts "Hit or stand (H/S): "
      answer = gets.chomp
      if answer.upcase == "H"
        deal_player
        player_score
          if @player.hand.calculate > 21
            puts "Bust....You lose..."
            return "Bust....You lose..."
            break
          end
      elsif answer.upcase == "S"
        player_score
        puts ""
        deal_dealer
        deal_dealer
        dealer_score
        puts ""

        while true
          if @dealer.hand.calculate > 21
            puts "You win!"
            return "You win!"
            break
          elsif @dealer.hand.calculate >= 17
            puts "Dealer stands."
            puts ""
            result
            break
          else
            puts "Dealer hits."
            puts ""
            deal_dealer
            dealer_score
          end
        end
        break
      else
        puts "Please type again."
      end
    end
  end
end


blackjack = Blackjack.new
blackjack.play!
