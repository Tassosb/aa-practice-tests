require 'rspec'
require 'crazy_eights'
require 'player'

describe "CrazyEights" do
  let(:players) { [ Player.new("Lee"),
                    Player.new("Ta") ] }

  subject(:game) { CrazyEights.new(3, players)}

  describe "#initialize" do
    it "assigns players" do
      expect(game.players).to include(players[0])
      expect(game.players).to include(players[1])
    end

    it "creates a deck" do
      expect(game.deck).to be_a(Deck)
    end
  end
end
