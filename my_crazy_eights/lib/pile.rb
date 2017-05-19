require_relative 'card'

class Pile
  attr_accessor :current_suit

  def initialize
  end

  #Resets the current_suit to nil unless the placed
  #card is an eight.
  def place(card)
  end

  def recycle!(deck)
  end

  def show
    if current_suit
      puts "The top suit is #{current_suit}"
    elsif top_card.nil?
      puts "Pile is empty"
    else
      puts "Top of pile: #{top_card}"
    end
    puts ""
  end

  def empty?
    count.zero?
  end

  def count
    @cards.count
  end

  #current_suit is nil unless someone plays an eight.
  #At that point, the player sets current suit to suit
  #of their choice.
  def set_next_suit(suit)
  end

  private

  def valid?(card)
    return true if empty? || card.value == :eight
    top_card.match?(card, current_suit)
  end

  def top_card
    @cards.first
  end
end
