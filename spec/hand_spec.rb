require 'hand'

describe Hand do

  let(:hand) { Hand.new }

  it "has 5 cards" do
    expect(hand.cards.count).to eq(5)
  end

end
