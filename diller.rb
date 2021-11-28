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
    if @score < 17 && @status != "finish"
      take_card(deck)
    else
      skip
    end
  end

  def cards
    if @hide_cards
      my_cards = ""
      @cards.each {my_cards += "* "}
      my_cards
    else
      super
    end
  end

  def to_s
    if @hide_cards
      "Карты диллера #{cards}"

    else
      "Карты диллера: #{cards} Счет диллера: #{@score}"
    end
  end

end
