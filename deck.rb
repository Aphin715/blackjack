require './card'

class Deck
  SUITS = ['♠', '♣', '♥', '♦']
  VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

  def initialize
    @deck = build_deck
  end

  def build_deck
    deck = []

    SUITS.each do |suit|
      VALUES.each do |value|
        deck.push(Card.new(value, suit))
      end
    end

    deck.shuffle
  end

  def pop
    @deck.pop
  end

end