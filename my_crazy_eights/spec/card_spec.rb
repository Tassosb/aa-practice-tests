require 'rspec'
require 'card'

describe "Card" do
  subject(:card) { Card.new(:hearts, :four) }

  describe "#initialize" do
    it "assigns a suit and value" do
      expect(card.suit).to eq(:hearts)
      expect(card.value).to eq(:four)
    end

    it "raises error for illegal suits and values" do
      expect{ Card.new(:hear, :four) }.to raise_error(
      "illegal suit (hear) or value (four)"
      )
    end
  end

  describe "#match?" do
    let(:same_suit) { Card.new(:hearts, :five) }
    let(:same_val) { Card.new(:spades, :four) }
    let(:diff_card) { Card.new(:spades, :five) }

    context "when chosen suit is nil" do
      it "returns true for cards of same suit" do
        expect(card.match?(same_suit, nil)).to be true
      end

      it "returns true for cards of same value" do
        expect(card.match?(same_val, nil)).to be true
      end

      it "returns false otherwise" do
        expect(card.match?(diff_card, nil)).to be false
      end
    end

    context "when there is a chosen suit" do
      it "returns true if other card matches chosen suit" do
        expect(card.match?(diff_card, :spades)).to be true
      end

      it "returns false if other card does not match chosen suit" do
        expect(card.match?(same_suit, :spades)).to be false
      end
    end
  end
end
