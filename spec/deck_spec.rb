require 'deck'

describe Deck do

  let(:deck) { Deck.new }

  it "has 52 cards" do
    expect(deck.cards.size).to eq(52)
  end

  it "is unshuffled" do
    new_deck = Deck.new
    expect(new_deck.cards).to eq(deck.cards)
  end

  describe "#shuffle" do

    it "shuffles the deck" do
      new_deck = Deck.new
      new_deck.shuffle
      expect(new_deck.cards).not_to eq(deck.cards)
    end

  end

  describe "#take(n)" do
    it "should take 3 cards from the top of the deck" do
      temp = deck.take(3)
      expect(temp).to eq(Deck.new.cards[0..2])
    end
  end

end
