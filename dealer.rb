class Dealer
  attr_accessor :hand

  def initialize
    @hand = []
  end
  def status (score)
    if score < 17
      false
    else
      puts "Dealer stands."
      true
end
end
end
