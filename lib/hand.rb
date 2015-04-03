
class Hand

  include Comparable

  POKER_HANDS = [:pair,
                 :two_pair,
                 :trip,
                 :straight,
                 :flush,
                 :full_house,
                 :quad,
                 :straight_flush]

  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def <=>(other_hand)
    if ranking_index == other_hand.ranking_index
      tie_breaker(other_hand)
    else
      ranking_index <=> other_hand.ranking_index
    end
  end

  def tie_breaker(other_hand)

  end

  def ranking_index
    POKER_HANDS.index(ranking) + 1
  end

  def ranking
    POKER_HANDS.reverse.each do |poker_hand|
      method_name = (poker_hand.to_s + "?").to_sym
      if self.send(method_name)
        return poker_hand + 1
      end
    end
    0
  end

  def straight_flush?
    straight? && flush?
  end

  def straight?
    min = strip_suits.min
    strip_suits.sort == (min..min+4).to_a
  end

  def flush?
    cards.all? { |card| card.suit == cards.first.suit }
  end

  def quad?
    matches.values.include?(4)
  end

  def full_house?
    matches.values.include?(3) && matches.values.include?(2)
  end

  def trip?
    matches.values.include?(3) && !matches.values.include?(2)
  end

  def two_pair?
    matches.values.count(2) == 2
  end

  def pair?
    matches.values.count(2) == 1
  end

  def matches
    strip_suits.each_with_object(Hash.new(0)) do |num, match_hash|
      match_hash[num]+=1
    end
  end

  #not robust, does not cover complicated cases
  def high_card
    strip_suits.max
  end

  def strip_suits
    self.cards.map { |card| card.poker_value }
  end

end
