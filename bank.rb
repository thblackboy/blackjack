class Bank
  attr_reader :cash
  def initialize
    @cash = 0
  end

  def rise_cash
    @cash +=20
  end

  def send_cash(*players)
    players.each {|player| player.get_money(@cash/players.size)}
    @cash = 0
  end
end
