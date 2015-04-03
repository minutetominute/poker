require 'hand'
require 'card'

describe Hand do

  let(:hand) { Hand.new(
    [Card.new(:deuce, :clubs),
     Card.new(:three, :clubs),
     Card.new(:four, :clubs),
     Card.new(:five, :clubs),
     Card.new(:six, :clubs)]) }

  it "has 5 cards" do
    expect(hand.cards.all? { |card| card.is_a?(Card) }).to eq(true)
    expect(hand.cards.count).to eq(5)
  end

  describe "#compare" do
    let(:hand2) { Hand.new (
      [Card.new(:queen, :clubs),
       Card.new(:six, :clubs),
       Card.new(:five, :diamonds),
       Card.new(:king, :hearts),
       Card.new(:nine, :diamonds)])}
  end

end
