class Player
  attr_reader :balance, :name
  def initialize(name)
    @name = name
    @balance = 100
  end

  def play(deck)
    pay
    @hand = Hand.new
    2.times {@hand.take(deck)}
    @status = "start"
  end

  def take_card(deck)
    @hand.take(deck)
    @status = "finish"
  end

  def show_hand
    @hand.show_cards
  end

  def show_score
    @hand.score
  end


  def pay
    raise "У #{@name} недостаточно средств для игры" if @balance < 10
    @balance -=10
  end


  def get_money(money)
    @balance += money
  end


end
