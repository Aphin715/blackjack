#!/usr/bin/env ruby
# encoding: UTF-8

require './player'
require './dealer'
class Blackjack
  attr_accessor :player, :deck, :dealer

  SUITS = ['♠', '♣', '♥', '♦']
  VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

def build_deck
  deck = []

  SUITS.each do |suit|
    VALUES.each do |value|
      deck.push(value + suit)
    end
  end

  deck.shuffle

end

#Dealer deals out two random cards to each the player and dealer
def initialize
  @deck = build_deck
  @player = Player.new
  @dealer = Dealer.new
end

#  Player gets two random cards and is then able to hit or stand
def deal (player)
  player.hand << @deck.pop
end

def initial_deal (player)
  2.times {deal (player)}
  puts player.hand
end



# Player's score is shown before each hit or stand


# A hit increases his card value


#




end

game = Blackjack.new
game.initial_deal (game.player)