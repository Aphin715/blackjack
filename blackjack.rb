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
  display_score(player)
end

def initial_deal(player)
  2.times {deal(player)}
end

def prompt
  print "Hit or stand (H/S)"
  gets.chomp
end

def validate(player)
  until (input = prompt.upcase) == "S"
    if input == "H"
      if !deal(player)
        break
      end
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

  if player.hand.length >= 2
    puts "#{player.class} score: #{score}"
    player.status(score)
  end

  if player.class=="Dealer"
    deal(player)
  end
end

def player_turn
  initial_deal(@player)
  validate(@player)
end

def dealer_turn
  initial_deal(@dealer)
end

end

game = Blackjack.new
game.player_turn
game.dealer_turn