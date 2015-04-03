require_relative "card"

class Deck

  attr_accessor :cards

  def initialize
    @cards = all_cards
  end

  def shuffle
    self.cards = cards.shuffle
  end

  def all_cards
    all=[]
    Card::SUIT_STRINGS.keys.each do |suit|
      Card::VALUE_STRINGS.keys.each do |value|
        all << Card.new(value,suit)
      end
    end
    all
  end

  def take(n)
    cards.shift(n)
  end

end
