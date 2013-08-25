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
  puts "Welcome to Blackjack!\n\n"
  @deck = build_deck
  @player = Player.new
  @dealer = Dealer.new
end

def deal(player)
  player.hand << @deck.pop
  puts "#{player.class} was dealt #{player.hand.last}"
  display_score(player)
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
    puts "\n"

    if input == "H" || input == "S"
      return input
    else
      puts "invalid input"
    end
  end
end

def calculate_score(player)
  score = 0
  aces = 0

  player.hand.each do |card|
    if ["J", "Q", "K"].include?card.chop
      score += 10
    elsif card.chop != "A"
      score += card.chop.to_i
    else
      aces += 1
    end
  end

  if score + (aces - 1) <= 10 && aces > 0
    score += 11
    aces -= 1
  end
  score += aces
end

def display_score(player)
  score = calculate_score(player)

  if player.hand.length >= 2
    puts "#{player.class} score: #{score}\n\n"
  end
    player.status(score)
end

def player_turn
  2.times {deal(@player)}
  prompt
end

def dealer_turn
  loop do
      break if !deal(@dealer)
    end
end

def winner
  d_score = calculate_score(@dealer)
  p_score = calculate_score(@player)

  if p_score > d_score
    puts "\nYou win!"
  elsif p_score == d_score
    puts "\nTie!"
  else
    puts "\nDealer wins!"
  end
end

def start
  player_turn
  dealer_turn
  winner
end

end

game = Blackjack.new
game.start