require_relative "../card"
require_relative "../hand"
require_relative "../deck"
require_relative "../player"
require_relative "../dealer"
require_relative "../blackjack"



    RSpec.describe Card do
      let (:card) { Card.new('♦', 'A') }

      describe '.new' do
      it 'creates a card' do
        expect(card.class).to eq(Card)
      end
    end

    describe '#type' do
      it 'defines the value into different types' do
        expect(card.type).to eq("ace")
      end
    end
  end


    RSpec.describe Deck do
      let (:deck) { Deck.new }

      describe '.new' do
      it 'creates a deck' do
        expect(deck.cards.size).to eq(52)
        end
      end
    end

  RSpec.describe Hand do
    let (:hand_1) {Hand.new}
    let (:hand_2) {Hand.new}
      describe '.new' do
      it 'creates a blank hand ' do
        expect(hand_1.hand.size).to eq(0)
        expect(hand_1.score).to eq(0)
        end
      end

      describe '#deal' do
        it 'deals a number of cards' do
          hand_1.deal(2)
          expect(hand_1.hand.size).to eq(2)
          expect(hand_1.score).to eq(0)

          hand_2.deal(3)
          expect(hand_2.hand.size).to eq(3)
          expect(hand_2.score).to eq(0)
        end
      end

      describe '#calculate_hand' do
        it 'calculates the score of a hand' do
            hand_1.deal(2)
            expect(hand_1.calculate_hand).to be > 1
            hand_2.deal(5)
            expect(hand_2.calculate_hand).to be > 10
        end
      end
    end


  RSpec.describe Player do
    let (:player) {Player.new}
    describe '.new' do
      it 'creates a new player' do
        expect(player.hand.hand).to eq([])
        expect(player.hand.score).to eq(0)
      end
    end
  end

  RSpec.describe Dealer do
    let (:dealer) {Dealer.new}
    describe '.new' do
      it 'creates a new dealer' do
        expect(dealer.hand.hand).to eq([])
        expect(dealer.hand.score).to eq(0)
      end
    end
  end

    RSpec.describe Blackjack do
      let (:blackjack) {Blackjack.new}

      describe '.new' do
      it 'creates a new blackjack game' do
        expect(blackjack.player.hand.hand).to eq([])
        expect(blackjack.dealer.hand.hand).to eq([])
        expect(blackjack.deck.cards.size).to eq(52)
        end
      end

      describe '#deal_player' do
        it 'deals out a card to player' do
          blackjack.deal_player
          expect(blackjack.player.hand.hand.size).to eq(1)
        end
      end

      describe '#deal_dealer' do
        it 'deals out a card to dealer' do
          blackjack.deal_dealer
          expect(blackjack.dealer.hand.hand.size).to eq(1)
        end
      end

      describe '#player_score' do
        it 'puts out a player score' do
          blackjack.deal_player
          blackjack.player.hand.hand[-1].value = 10
          blackjack.deal_player
          blackjack.player.hand.hand[-1].value = 9
          expect(blackjack.player_score).to eq(19)
        end

        it 'puts out a player score' do
          blackjack.deal_player
          blackjack.player.hand.hand[-1].value = "A"
          blackjack.deal_player
          blackjack.player.hand.hand[-1].value = "K"
          expect(blackjack.player_score).to eq(21)
        end
      end

      describe '#dealer_score' do
        it 'puts out a dealer score' do
          blackjack.deal_dealer
          blackjack.dealer.hand.hand[-1].value = 10
          blackjack.deal_dealer
          blackjack.dealer.hand.hand[-1].value = 9
          expect(blackjack.dealer_score).to eq(19)
        end

        it 'puts out a dealer score' do
          blackjack.deal_dealer
          blackjack.dealer.hand.hand[-1].value = "A"
          blackjack.deal_dealer
          blackjack.dealer.hand.hand[-1].value = "K"
          expect(blackjack.dealer_score).to eq(21)
        end
      end

      describe '#result' do
        it 'shows results' do
          blackjack.deal_dealer
          blackjack.dealer.hand.hand[-1].value = 10
          blackjack.deal_player
          blackjack.player.hand.hand[-1].value = "A"
          expect(blackjack.result).to eq("You win!")
        end
      end

      describe '#play!' do
        it 'plays the game' do
          blackjack.play!
          allow(blackjack.play!).to receive(:gets).and_return("S")
          expect{blackjack.play!}.to output(" ").to_stdout
        end
      end
end
