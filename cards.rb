class Cards
  attr_reader :name, :value


  def initialize(name, type)
    @name = name
    @type = type
    case name
    when (2..10)
      @value = name
    when "J", "D", "K"
      @value = 10
    when "T"
      @value = 11
    end
  end

  def to_s
    "#{@name}#{@type} "
  end
end
