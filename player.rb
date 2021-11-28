class Player
  attr_reader :balance, :name, :status, :score
  def initialize(name)
    @name = name
    @balance = 100
  end

  def play(deck)
    @cards = []
    @score = 0
    @tous_count = 0
    2.times {take_card(deck)}
    @status = "start"
  end

  def take_card(deck)
    card = deck.take_card
    @cards << card
    @tous_count +=1 if card.name == "T"
    @score += card.value
    @status = "finish"
    check_score
  end

  def check_score
    if @score > 21
      if @tous_count > 0
        @score -=10
        @tous_count -=1
      else
        @status = "finish"
      end
    end
  end

  def cards
    my_cards = ""
    @cards.each {|card| my_cards += card.to_s}
    my_cards
  end


  def pay
    raise "У #{@name} недостаточно средств для игры" if @balance < 10
    @balance -=10
  end

  def pay?
    pay
    true
  rescue RuntimeError => e
    puts e.message
    false
  end

  def get_money(money)
    @balance += money
  end

  def skip
    @status = "skip"
  end

  def open_cards
    @status = "finish"
  end

  def to_s
    "Ваши карты : #{cards} Ваш счет: #{@score}"
  end


end
