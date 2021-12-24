class Diller < Player
  attr_accessor :hide_cards
  def initialize
    super("Диллер")
    @hide_cards = true
  end

  def play(deck)
    super(deck)
    @hide_cards = true
  end

  def logic(deck)
    if @hand.score < 17 && @status != "finish"
      take_card(deck)
    end
  end

end
