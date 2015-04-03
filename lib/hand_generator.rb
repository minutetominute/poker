require "./lib/hand.rb"
require "./lib/deck.rb"

@results = {}

methods = [:straight_flush?, :straight?,
  :flush?, :quad?, :full_house?, :trip?,
  :two_pair?, :pair?]

def print_results
  @results.each do |key1, value1|
    puts 'describe "#straight_flush?" do'
    puts 'let(:hand2) { Hand.new('
    puts '['
    value1.cards.each do |card|
      puts "  Card.new(:#{card.value}, :#{card.suit}),"
    end
  end
  puts '])}'
  puts 'end'
end

begin
  methods.each do |method|
    hand = Hand.new(Deck.new.deal)
    loop do
      @results[method] = hand
      raise
      break if hand.send(method)
      hand = Hand.new(Deck.new.shuffle.deal)
    end
    @results[method] = hand
  end
rescue StandardError => e
  puts e
  print_results
end
