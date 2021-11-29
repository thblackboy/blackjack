class Game
  def initialize(name)
    @user = Player.new(name)
    @diller = Diller.new
    @deck = Deck.new
    @bank = Bank.new
  end

  def take_card(main)
    @user.take_card(@deck)
    @diller.logic(@deck)
    main.game_over
  end

  def skip(main)
    @diller.logic(@deck)
    main.command_list
  end

  def jackpot
    @bank.cash
  end

  def game_over(main)
    @diller.logic(@deck)
    main.game_over
  end

  def show_cards(player)
    if player == "user"
      @user.show_hand
    else
      if @diller.hide_cards
        "**"
      else
        @diller.show_hand
      end
    end
  end

  def show_score(player)
    if player == "user"
      @user.show_score
    else
      if @diller.hide_cards
        "**"
      else
        @diller.show_score
      end
    end
  end

  def play(main)
    @deck.randomize_deck
    @user.play(@deck)
    @diller.play(@deck)
    @bank.rise_cash
    main.command_list
  end

  def get_winner
    @diller.hide_cards = false
    if @user.show_score > 21
      if @diller.show_score <=21
        @bank.send_cash(@diller)
        @diller.name
      else
        @bank.send_cash(@diller, @user)
        "Ничья"
      end
    else
      if @diller.show_score > 21 || @user.show_score > @diller.show_score
        @bank.send_cash(@user)
        @user.name
      elsif @user.show_score == @diller.show_score
        @bank.send_cash(@diller, @user)
        "Ничья"
      else
        @bank.send_cash(@diller)
        @diller.name
      end
    end
  end

  def balances
    puts "#{@user.name} Баланс: #{@user.balance}"
    puts "#{@diller.name} Баланс: #{@diller.balance}"
  end

end
