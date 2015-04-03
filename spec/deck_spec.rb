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

  describe "#draw(n)" do
    it "draws 3 cards from the top of the deck" do
      temp = deck.draw(3)
      expect(temp).to eq(Deck.new.cards[0..2])
    end

    it "raises error if n is greater than 3" do
      expect do
        deck.draw(4)
      end.to raise_error("Can't draw more than 3 cards")
    end

  end

  describe "#return(cards)" do
    it "returns cards to the bottom of the deck" do
      temp = deck.draw(3)
      deck.return(temp)
      expect(deck.cards[-3..-1]).to eq(temp)
    end
  end

end
