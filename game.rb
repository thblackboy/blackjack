class Game
  def initialize
    create_players
    @deck = Deck.new
    @bank = Bank.new
    start_game
  end

  def set_winner
    if @user.score > 21
      if @diller.score <=21
        @bank.send_cash(@diller)
        puts "Победил #{@diller.name}"
      else
        @bank.send_cash(@diller, @user)
        puts "Ничья"
      end
    else
      if @diller.score > 21 || @user.score > @diller.score
        @bank.send_cash(@user)
        puts "Победил #{@user.name}"
      elsif @user.score == @diller.score
        @bank.send_cash(@diller, @user)
        puts "Ничья"
      else
        @bank.send_cash(@diller)
        puts "Победил #{@diller.name}"
      end
    end
  end

  def playing?
    if @user.status == "finish" ||
      ( @user.status == "skip" && @diller.status == "skip" )
      false
    else
      true
    end
  end

  def create_players
    print "Введите имя: "
    @user = Player.new(gets.chomp)
    @diller = Diller.new
  end

  def get_balances
    puts "#{@user.name} Баланс: #{@user.balance}"
    puts "#{@diller.name} Баланс: #{@diller.balance}"
  end

  def play_again?
    puts "1 - Сыграть еще раз"
    puts "2 - Закрыть приложение"
    print "Ваш выбор: "
    case gets.chomp.to_i
    when 1
      start_game
    when 2
      send('exit')
    else
      raise "Такого варианта не существует"
    end
  rescue RuntimeError => e
    puts e.message
    retry
  end

  def choose_variant
    puts "1 - Взять карту"
    puts "2 - Пропустить ход"
    puts "3 - Открыть карты"
    puts "0 - Закрыть приложение"
    print "Ваш выбор: "
    gets.chomp.to_i
  end

  def start_game
    if !(@user.pay? && @diller.pay?)
      puts "Игра окончена"
      send ('exit')
    else
      puts "Начинаем игру"
      @deck.randomize_deck
      @bank.rise_cash
      get_balances
      @user.play(@deck)
      @diller.play(@deck)

      puts "Возможный выигрыш: #{@bank.cash}"
      puts
      puts @user
      puts @diller

      while playing?
        begin
          case choose_variant
          when 1
            @user.take_card(@deck)
            puts @user
          when 2
            @user.skip
            puts "Пропуск хода"
          when 3
            @user.open_cards
          when 0
            send('exit')
          else
            raise "Такого варианта не существует"
          end
        rescue RuntimeError => e
          puts e.message
          retry
        end
        @diller.logic(@deck)
        puts @diller
      end
      puts
      set_winner
      @diller.hide_cards = false
      puts @user
      puts @diller
      puts
      get_balances
      play_again?
    end
  end

end





