class Hand

  POKER_HANDS = [:one_pair,
                 :two_pair,
                 :three_of_a_kind,
                 :straight,
                 :flush,
                 :full_house,
                 :four_of_a_kind,
                 :straight_flush]

  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def ranking
  end
end
