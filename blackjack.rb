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

def initialize
  @deck = build_deck
  @player = Player.new
  @dealer = Dealer.new
end

def deal(player)
  player.hand << @deck.pop
  puts "#{player.class} was dealt #{player.hand.last}"
  display_score(player) if player.hand.length >= 2
end

def initial_deal(player)
  2.times {deal(player)}
end

def prompt
  hit if validate == "H"
end

def hit
  deal(@player)
  prompt
end

def validate
  loop do
    print "Hit or stand (H/S): "
    input = gets.chomp.upcase

    if input == "H" || input == "S"
      return input
    else
      puts "invalid input"
    end
  end
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

  puts "#{player.class} score: #{score}"
  player.status(score)
end

def player_turn
  initial_deal(@player)
  prompt
end

def dealer_turn
  initial_deal(@dealer)
end

end

game = Blackjack.new
game.player_turn
game.dealer_turn