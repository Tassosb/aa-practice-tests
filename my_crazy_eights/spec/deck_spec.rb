require 'card'
require 'deck'
require 'player'

describe Deck do
  describe "::all_cards" do
    subject(:all_cards) { Deck.all_cards }

    it "starts with a count of 52" do
      expect(all_cards.count).to eq(52)
    end

    it "returns all cards without duplicates" do
      deduped_cards = all_cards
        .map { |card| [card.suit, card.value] }
        .uniq
        .count
      expect(deduped_cards).to eq(52)
    end
  end

  let(:cards) do
    cards = [
      Card.new(:spades, :king),
      Card.new(:spades, :queen),
      Card.new(:spades, :jack)
    ]
  end

  describe "#initialize" do
    it "by default fills itself with 52 cards" do
      deck = Deck.new
      # debugger
      expect(deck.count).to eq(52)
    end

    it "can be initialized with an array of cards" do
      deck = Deck.new(cards)
      expect(deck.count).to eq(3)
    end
  end

  let(:deck) do
    Deck.new(cards.dup)
  end

  it "does not expose its cards directly" do
    expect(deck).not_to respond_to(:cards)
  end

  describe "#take" do
    # **use the front of the cards array as the top**
    it "takes n cards from top of deck" do
      expect(deck.count).to eq(3)
      expect(deck.take(1)).to eq(cards[0..0])
      expect(deck.count).to eq(2)
      expect(deck.take(2)).to eq(cards[1..2])
    end

    it "raises error if not enough cards" do
      expect { deck.take(4) }.to raise_error("not enough cards")
    end
  end

  describe "#return" do
    let(:more_cards) do
      [ Card.new(:hearts, :four),
        Card.new(:hearts, :five),
        Card.new(:hearts, :six) ]
    end

    it "returns cards to the deck" do
      deck.return(more_cards)
      expect(deck.count).to eq(6)
    end

    it "does not destroy the passed array" do
      more_cards_dup = more_cards.dup
      deck.return(more_cards_dup)
      expect(more_cards_dup).to eq(more_cards)
    end

    it "adds new cards to the bottom of the deck" do
      deck.return(more_cards)
      deck.take(3) # toss 3 cards away

      expect(deck.take(1)).to eq(more_cards[0..0])
      expect(deck.take(1)).to eq(more_cards[1..1])
      expect(deck.take(1)).to eq(more_cards[2..2])
    end
  end

  describe "#deal" do
    let(:deck) { Deck.new(Deck.all_cards) }
    let(:players) do
      [ Player.new("Cornelia"),
        Player.new("Delia"),
        Player.new("Modelia") ]
    end

    before(:each) do
      deck.deal(8, players)
    end

    it "gives eight cards to each player" do
      players.each do |player|
        expect(player.hand.length).to eq(8)
      end
    end

    it "takes out the cards from the deck" do
      expect(deck.count).to eq(52 - (players.count * 8))
    end

    it "raises error if not enough cards" do
      expect{ deck.deal(20, players) }.to raise_error("too many players")
    end
  end
end
