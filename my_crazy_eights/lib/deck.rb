require_relative 'card'
require 'byebug'

# Represents a deck of playing cards.
class Deck
  # Returns an array of all 52 playing cards.
  def self.all_cards
    Card.suits.product(Card.values).map do |suit, value|
      Card.new(suit, value)
    end
  end

  def initialize(cards = Deck.all_cards)
    @cards = cards
  end

  # Returns the number of cards in the deck.
  def count
    @cards.count
  end

  # Takes a cards from the top of the deck.
  def take(n)
  end

  def empty?
    count == 0
  end

  def shuffle!
    @cards.shuffle!
  end

  # Returns an array of cards to the bottom of the deck.
  def return(cards)
    @cards.concat(cards)
  end

  def deal(num_cards, players)
  end
end
