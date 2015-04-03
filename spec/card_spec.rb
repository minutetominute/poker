require 'card'

describe Card do
  let(:card) { Card.new(:deuce, :diamonds) }

  it "has a suit" do
    expect(card.suit).to eq (:diamonds)
  end

  it "has a value" do
    expect(card.value).to eq(:deuce)
  end

end
