class Hand
  attr_accessor :cards
  attr_reader :name

  def initialize(name)
    @name = name
    @cards = []
  end

  def hit(card)
  end

  def stay
  end

  def score
  end

  def busted?
  end
end