#!/usr/bin/env ruby
# encoding: UTF-8

require './deck'
require './hand'

class Blackjack

  def initialize
    puts "Welcome to Blackjack!\n\n"
    @deck = Deck.new
    @player = Hand.new('Player')
    @dealer = Hand.new('Dealer')
  end

  def start
    player_turn
    dealer_turn
    winner
  end

  def player_turn
    2.times { deal(@player) }
    prompt
  end

  def dealer_turn
    loop do
        deal(@dealer)
        break if @dealer.score >= 17
      end
  end

  def deal(player)
    player.cards << @deck.pop
    puts "#{ player.name } was dealt #{ player.cards.last.value }#{ player.cards.last.suit }"
    puts "#{ player.name } score: #{ player.score }\n\n" if player.cards.length >= 2

    player.lose if player.busted?
  end

  def prompt
    hit if validate == "H"
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

  def hit
    deal(@player)
    prompt
  end

  def winner
    if @player.score > @dealer.score
      puts 'You win!'
    elsif @player.score == @dealer.score
      puts 'Tie!'
    else
      puts 'Dealer wins!'
    end
  end

end

game = Blackjack.new
game.start