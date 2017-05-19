require 'rspec'
require 'pile'
require 'card'

describe "Pile" do
  subject(:pile) { Pile.new }

  describe "initialize" do
    it "assigns cards to an empty array" do
      expect(pile.count).to eq(0)
    end

    it "doesn't reveal cards" do
      expect(pile).not_to respond_to(:cards)
    end

    it "sets current suit to nil" do
      expect(pile.current_suit).to eq(nil)
    end
  end

  let(:cards) { [Card.new(:spades, :king),
                Card.new(:spades, :four),
                Card.new(:hearts, :four),
                Card.new(:diamonds, :eight)]
            }

  describe "place" do
    #top of pile is front of array
    before { pile.place(cards[0]) }

    it "adds card to top of pile" do
      expect(pile.count).to eq(1)
      pile.place(cards[1])
      expect(pile.count).to eq(2)
    end

    it "raises error when cards don't match" do
      expect{ pile.place(cards[2]) }.to raise_error("Invalid play")
    end

    it "doesn't raise error for eights" do
      expect{ pile.place(cards[3]) }.not_to raise_error
    end

    it "resets current_suit to nil" do
      pile.current_suit = :hearts
      pile.place(cards[2])
      expect(pile.current_suit).to eq(nil)
    end
  end

  describe "#set_next_suit" do
    it "sets the current suit" do
      pile.set_next_suit(:spades)
      expect(pile.current_suit).to eq(:spades)
    end

    it "raises an error if called with invalid suit" do
      expect{ pile.set_next_suit(:no_good) }.to raise_error("Not a valid suit")
    end
  end

  describe "recycle!" do
    let(:deck) { double("deck", shuffle!: true, return: true) }

    before(:each) do
      cards.each { |card| pile.place(card) }
    end

    it "returns cards to deck" do
      expect(deck).to receive(:return).with(cards.reverse.drop(1))
      pile.recycle!(deck)
    end

    it "shuffles the deck" do
      expect(deck).to receive(:shuffle!)
      pile.recycle!(deck)
    end

    it "leaves the top card in the pile" do
      pile.recycle!(deck)
      expect(pile.count).to eq(1)
    end
  end
end
