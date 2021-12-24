require_relative 'cards.rb'
require_relative 'deck.rb'
require_relative 'player.rb'
require_relative 'diller.rb'
require_relative 'bank.rb'
require_relative 'game.rb'
require_relative 'hand.rb'

class BlackJack
  def initialize()
    start
  end

  def enter_name
    print "Введите имя: "
    name = gets.chomp
    @game = Game.new(name)
  end

  def your_choise
    print "Ваш выбор: "
    gets.chomp.to_i
  end

  def get_balances
    @game.balances
  end

  def show_user_info
    puts "Ваши карты: #{@game.show_cards("user")}"
    puts "Счет: #{@game.show_score("user")}"
  end

  def show_diller_info
    puts "Карты диллера: #{@game.show_cards("diller")}"
    puts "Счет: #{@game.show_score("diller")}"
  end

  def jackpot
    puts "Выигрыш: #{@game.jackpot}"
  end

  def command_list
    get_balances
    jackpot
    show_diller_info
    show_user_info
    puts "1 - Взять карту"
    puts "2 - Пропустить ход"
    puts "3 - Открыть карты"
    puts "0 - Закрыть приложение"
    case your_choise
    when 1
      @game.take_card(self)
    when 2
      @game.skip(self)
      puts "Пропуск хода"
    when 3
      @game.game_over(self)
    when 0
    send('exit')
    else
    raise "Такого варианта не существует"
    end
  rescue RuntimeError => e
    puts e.message
    retry
  end

  def start
    enter_name
    puts "1 - Начать игру"
    puts "2 - Закрыть приложение"
    case your_choise
    when 1
      @game.play(self)
    when 2
      send('exit')
    else
      raise "Такого варианта не существует"
    end
  rescue RuntimeError => e
    puts e.message
    retry
  end

  def game_over
    puts "Победил: #{@game.get_winner}"
    show_diller_info
    show_user_info
    play_again_list
  end

  def play_again_list
    puts "1 - Сыграть еще раз"
    puts "2 - Закрыть приложение"
    case your_choise
    when 1
      @game.play(self)
    when 2
      send('exit')
    else
      raise "Такого варианта не существует"
    end
  rescue RuntimeError => e
    puts e.message
    retry
  end

end
