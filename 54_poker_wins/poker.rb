class PokerHand
  attr :hand

  def initialize(cards)
    raise "Need 5 cards per hand!" if cards.size != 5
    @hand = cards
    @hand.map! { |c| Card.create c } unless cards.all? { |c| c.is_a? Card }
  end

  def to_s
    case
      when is_flush? && is_straight? && lowest == 10
        "Royal Flush"
      when is_flush? && is_straight?
        "Straight Flush"
      when is_flush?
        "Flush"
      when is_straight?
        "Straight"
      when is_four_of_a_kind?
        "Four Of A Kind"
      when is_full_house?
        "Full House"
      when is_three_of_a_kind?
      "Three Of A Kind"
      when is_two_pair?
        "Two Pair"
      when is_pair?
        "Pair"
      else
        "High Card"
    end
  end

  def ranks
    @ranks ||= @hand.map(&:rank)
  end

  def suits
    @suits ||= @hand.map(&:suit)
  end

  def is_flush?
    (@is_flush ||= suits.uniq.size) == 1
  end

  def is_straight?
    (@is_straight ||= (lowest...lowest + 5).to_a - ranks).empty?
  end

  def is_four_of_a_kind?
    (@is_four_of_a_kind ||= duplicates & [4]).any?
  end

  def is_full_house?
    @is_full_house ||= (duplicates.include?(3) && duplicates.include?(2))
  end

  def is_three_of_a_kind?
    @is_three_of_a_kind ||= (duplicates.include?(3) && !duplicates.include?(2))
  end

  def is_two_pair?
    (@is_two_pair ||= duplicates.count(2)) == 2
  end

  def is_pair?
    (@is_pair ||= duplicates.count(2)) == 1
  end

  def lowest
    @lowest ||= ranks.min
  end

  def duplicates
    @duplicates ||= ranks.inject({}) { |h, v| h[v] = h[v].to_i + 1; h }.values
  end

  def score
    hand_values = {
      high_card: 1, pair: 2, two_pair: 3, three_of_a_kind: 4, straight: 5,
      full_house: 6, flush: 7, four_of_a_kind: 8, straight_flush: 9, royal_flush: 10
    }
    hand_values[self.to_s.gsub(/ /, '_').downcase.to_sym]
  end

  def <=>(opponent)
    comparison = (self.score <=> opponent.score)
    return comparison unless comparison == 0
    
    return (ranks.max <=> opponent.ranks.max) if ranks.uniq.size == 5

    our_high, their_high = self.most, opponent.most
    comparison = (our_high <=> their_high)
    return comparison unless comparison == 0

    self.most(our_high) <=> opponent.most(their_high)
  end

  def most(*exclude)
    ranks.reject { |i| exclude.include?(i) }.group_by { |i| i }.values.max_by(&:size).first
  end
end

class Card
	attr :rank, :suit

	def initialize(rank, suit)
		@rank, @suit = rank, suit
	end

  def to_s
    "#@rank of #@suit"
  end
	  
  def self.create(str)
    suits = { 'S' => 'Spades', 'H' => 'Hearts', 'C' => 'Clubs', 'D' => 'Diamonds' }
    ranks = { 'T' => 10, 'J' => 11, 'Q' => 12, 'K' => 13, 'A' => 14 }
    2.upto(9) { |i| ranks[i.to_s] = i }
    m = str.match /(?<rank>[2-9TJQKA])(?<suit>[SCHD])/i
    Card.new ranks[m[:rank]].to_i, suits[m[:suit]]
  end
end

hands_won = 0
File.open("poker.txt") do |file|
  while line = file.gets
    cards = line.split ' '
    hand1, hand2 = PokerHand.new(cards.take(5)), PokerHand.new(cards.last(5))
    hands_won += 1 if (hand1 <=> hand2) > 0
  end
end
print "Player 1 won #{hands_won} hands"
