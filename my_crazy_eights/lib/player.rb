class Player
  attr_accessor :hand, :name

  def initialize(name)
    @hand = []
    @name = name
  end

  def take_turn(deck, pile)
    pile.recycle! if deck.empty?

    display(pile)

    begin
      handle_input(get_input, deck, pile)
    rescue StandardError => e
      puts e.message
      retry
    end
  end

  def to_s
    "#{name}"
  end

  def won?
  end

  private

  def display(pile)
    pile.show
    show_hand
  end

  def handle_input(input, deck, pile)
    case input
    when 'n'
      draw_card(deck, pile)
    when 'y'
      make_play(deck, pile)
    else
      raise "Sorry do not copy"
    end
  end

  def get_input
    puts "Can you play a card? (y / n)"
    input = gets.chomp
  end

  def get_card
    puts "Enter the index of the card you'd like to play"
    begin
      chosen_idx = Integer(gets.chomp)
    rescue ArgumentError
      puts "Please enter just the number index"
      retry
    end

    hand[chosen_idx]
  end

  def show_hand
    hand.each_with_index do |card, i|
      puts "card #{i}: #{card}"
    end
  end

  def draw_card(deck, pile)
    hand << deck.take(1).first
    take_turn(deck, pile)
  end

  def make_play(deck, pile)
    card = get_card

    begin
      pile.place(card)
    rescue StandardError => e
      puts e.messagegit
      take_turn(deck, pile)
    end

    hand.delete(card)

    choose_suit(card, pile) if card.value == :eight
  end

  def choose_suit(card, pile)
    begin
      puts "Which suit would you like?"
      puts "Options: spades, diamonds, hearts, clubs"

      pile.set_next_suit(gets.chomp.to_sym)
    rescue StandardError => e
      puts e.message
      retry
    end
  end
end
