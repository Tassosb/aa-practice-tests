require_relative 'player'
require_relative 'deck'
require_relative 'pile'

class CrazyEights
  attr_reader :players, :deck, :winners, :pile

  def initialize(num_cards, players)
    @players = players
    @winners = []

    @deck = Deck.new
    @pile = Pile.new

    setup(num_cards)
  end

  def play
    until over?
      system('clear')
      play_turn
    end

    show_winners
  end

  private

  def show_winners
    puts "Winner!: #{winners.first}"
    puts "Second: #{winners[1]}" unless winners[1].nil?
    puts "Third: #{winners[2]}" unless winners[2].nil?
  end

  def play_turn
    puts "#{current_player.name}'s turn"
    current_player.take_turn(deck, pile)
    switch_players!
    add_winners
  end

  def add_winners
    players.each do |player|
      winners << player if player.won?
    end

    @players -= winners
  end

  def setup(num_cards)
    deck.shuffle!
    deck.deal(num_cards, players)
  end

  def current_player
    players.first
  end

  def switch_players!
    players.rotate!
  end

  def players_left
    players.count
  end

  def over?
    players_left == 1
  end
end

if __FILE__ == $PROGRAM_NAME
  system('clear')

  puts "How many people are playing?"
  num_players = Integer(gets.chomp)

  players = []
  num_players.times do |i|
    puts "Player #{i + 1} enter your name"
    players << Player.new(gets.chomp)
  end

  puts "Deal how many cards?"
  num_cards = Integer(gets.chomp)

  game = CrazyEights.new(num_cards, players)
  game.play
end
