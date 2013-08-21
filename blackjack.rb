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
def deal(player)
  player.hand << @deck.pop
end

def initial_deal(player)
  2.times {deal(player)}
  puts player.hand
end

def prompt
  print "Hit or stand (H/S)"
  gets.chomp
end

def validate(player)
  until (input = prompt.upcase) == "S"
    if input == "H"
      if !hit(player)
        break
      end
    else
      puts "invalid input"
    end
  end
  puts "starndiingasd"
end

def hit(player)
  deal(player)
  display_score(player)
end

def display_score(player)
  score = 0
  player.hand.each do |card|
    if card.chop == "J" || card.chop == "Q" || card.chop == "K"
      score += 10
    elsif card.chop != "A"
      score += card.chop.to_i
    else
      if score < 11
        score += 11
      else
        score += 1
      end
    end
  end
  if score > 21
    puts "BUST! YOU'RE A LOSER"
    false
  else
    puts score
    true
  end
end


# Player's score is shown before each hit or stand



#




end

game = Blackjack.new
game.initial_deal(game.player)
game.validate(game.player)
