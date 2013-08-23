class Dealer
  attr_accessor :hand

  def initialize
    @hand = []
  end

  def status (score)
    if score < 17
      true
    else
      puts "Dealer stands."
      false
    end
  end
end
