require_relative "card"

class Deck

  attr_accessor :cards

  def initialize
    @cards = all_cards
  end

  def shuffle
    self.cards = cards.shuffle
    self
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

  def draw(n)
    raise "Can't draw more than 3 cards" if n > 3
    take(n)
  end

  #
  def return(cards)
    self.cards.concat(cards)
  end

  def deal
    cards.take(5)
  end

  private

  def take(n)
    cards.shift(n)
  end

end
