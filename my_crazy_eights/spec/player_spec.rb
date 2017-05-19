require 'rspec'
require 'player'

describe "Player" do
  subject(:player) { Player.new("Omar") }

  describe "initialize" do
    it "starts with an empty hand" do
      expect(player.hand).to be_empty
    end

    it "assigns name" do
      expect(player.name).to eq("Omar")
    end
  end

  describe "won?" do
    it "returns true if hand is empty" do
      expect(player.won?).to be true
    end
  end
end
