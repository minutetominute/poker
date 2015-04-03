require 'hand'
require 'card'

describe Hand do

  let(:hand) do
    Hand.new([
      Card.new(:deuce, :clubs),
      Card.new(:three, :clubs),
      Card.new(:four, :clubs),
      Card.new(:five, :spades),
      Card.new(:seven, :clubs)
    ])
  end

  it "has 5 cards" do
    expect(hand.cards.all? { |card| card.is_a?(Card) }).to eq(true)
    expect(hand.cards.count).to eq(5)
  end

  describe "test hands" do

    describe "#straight_flush?" do

      #clean up
      let(:hand2) { Hand.new(
        [Card.new(:deuce, :clubs),
         Card.new(:three, :clubs),
         Card.new(:four, :clubs),
         Card.new(:five, :clubs),
         Card.new(:six, :clubs)])}

      it "returns true for a straight flush" do
        expect(hand2.straight_flush?).to eq(true)
        expect(hand2).to be_straight_flush
      end

      it "return false if not a straight flush" do
        expect(hand.straight_flush?).to eq(false)
      end

      it "straight flush beats no hand" do
        expect(hand2 > hand).to eq(true)
      end

    end

    describe "#straight?" do
      let(:hand2) { Hand.new(
        [Card.new(:deuce, :clubs),
         Card.new(:three, :spades),
         Card.new(:four, :clubs),
         Card.new(:five, :clubs),
         Card.new(:six, :clubs)])}

      it "returns true for a straight" do
        expect(hand2.straight?).to eq(true)
      end

      it "return false if not a straight" do
        expect(hand.straight?).to eq(false)
      end

      it "straight beats no hand" do
        expect(hand2 > hand).to eq(true)
      end
    end

    describe "#flush?" do
      let(:hand2) { Hand.new(
        [Card.new(:deuce, :clubs),
         Card.new(:three, :clubs),
         Card.new(:four, :clubs),
         Card.new(:five, :clubs),
         Card.new(:seven, :clubs)])}

      it "returns true for a flush" do
        expect(hand2.flush?).to eq(true)
      end

      it "return false if not a flush" do
        expect(hand.flush?).to eq(false)
      end

      it "flush beats no hand" do
        expect(hand2 > hand).to eq(true)
      end
    end

    describe "#quad?" do
      let(:hand2) { Hand.new(
        [Card.new(:deuce, :clubs),
         Card.new(:deuce, :spades),
         Card.new(:deuce, :diamonds),
         Card.new(:deuce, :hearts),
         Card.new(:six, :clubs)])}

      it "returns true for a 4 of a kind" do
        expect(hand2.quad?).to eq(true)
      end

      it "return false if not a 4 of a kind" do
        expect(hand.quad?).to eq(false)
      end

      it "4 of a kind beats no hand" do
        expect(hand2 > hand).to eq(true)
      end
    end

    describe "#full_house?" do
      let(:hand2) { Hand.new(
        [Card.new(:deuce, :hearts),
         Card.new(:deuce, :spades),
         Card.new(:deuce, :clubs),
         Card.new(:five, :clubs),
         Card.new(:five, :spades)])}

      it "returns true for a full house" do
        expect(hand2.full_house?).to eq(true)
      end

      it "return false if not full house" do
        expect(hand.full_house?).to eq(false)
      end

      it "full house beats no hand" do
        expect(hand2 > hand).to eq(true)
      end
    end

    describe "#trip?" do
      let(:hand2) { Hand.new(
        [Card.new(:deuce, :hearts),
         Card.new(:deuce, :spades),
         Card.new(:deuce, :clubs),
         Card.new(:three, :clubs),
         Card.new(:five, :spades)])}

      it "returns true for a trip" do
        expect(hand2.trip?).to eq(true)
      end

      it "return false if not trip" do
        expect(hand.trip?).to eq(false)
      end

      it "3 of a kind beats no hand" do
        expect(hand2 > hand).to eq(true)
      end
    end

    describe "#two_pair?" do
      let(:hand2) { Hand.new(
        [Card.new(:deuce, :hearts),
         Card.new(:deuce, :spades),
         Card.new(:three, :clubs),
         Card.new(:five, :clubs),
         Card.new(:five, :spades)])}

      it "returns true for a two pair" do
        expect(hand2.two_pair?).to eq(true)
      end

      it "return false if not a two_pair" do
        expect(hand.two_pair?).to eq(false)
      end

      it "2 pair beats no hand" do
        expect(hand2 > hand).to eq(true)
      end
    end

    describe "#pair?" do
      let(:hand2) { Hand.new(
        [Card.new(:deuce, :hearts),
         Card.new(:deuce, :spades),
         Card.new(:three, :clubs),
         Card.new(:four, :clubs),
         Card.new(:five, :spades)])}

      it "returns true for a pair" do
        expect(hand2.pair?).to eq(true)
      end

      it "return false if not a pair" do
        expect(hand.pair?).to eq(false)
      end

      it "pair beats no hand" do
        expect(hand2 > hand).to eq(true)
      end

    end


  end
end
