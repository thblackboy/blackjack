class Deck
  attr_reader :cards
  CARD_NAMES = [2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "D", "K", "T"]
  CARD_TYPES = ["<3", "+", "^", "<>"]

  def initialize
    @cards = []
    CARD_NAMES.each do |card_name|
      CARD_TYPES.each do |card_type|
        @cards << Card.new(card_name, card_type)
      end
    end
  end


  def randomize_deck
    @deck = @cards.sort_by{rand}
  end

  def take_card
    @deck.pop
  end
end
