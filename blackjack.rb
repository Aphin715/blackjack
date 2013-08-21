#!/usr/bin/env ruby
# encoding: UTF-8

require "deck"
require "player"
require "dealer"
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



#  Player can decide if he wants to hit or stand


# Player's score is shown before each hit or stand


# A hit increases his card value


#




