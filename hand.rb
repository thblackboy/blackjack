class Hand
  attr_reader :score
  def initialize
    @cards = []
    @score = 0
    @tous_count = 0
  end

  def take(deck)
    card = deck.take_card
    @cards << card
    @tous_count += 1 if card.name == "T"
    @score += card.value
    check_score
  end

  def check_score
    if @score > 21
      if @tous_count > 0
        @score -=10
        @tous_count -=1
      end
    end
  end

  def show_cards
    my_cards = ""
    @cards.each {|card| my_cards += card.to_s}
    my_cards
  end

end
