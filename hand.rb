class Hand
  attr_accessor :cards
  attr_reader :name

  def initialize(name)
    @name = name
    @cards = []
  end

  def score
    score = 0
    aces = 0

    @cards.each do |card|
      if ["J", "Q", "K"].include?(card.value)
        score += 10
      elsif card.value != "A"
        score += card.value.to_i
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

  def busted?
    return score > 21 ? true : false
  end

  def lose
    puts @name == 'Player' ? 'BUST! You lose!' : 'Dealer busts, you win!'
    exit
  end
end