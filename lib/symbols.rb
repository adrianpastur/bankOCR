require 'pry'

class Symbols

def initialize
  @symbol_1 = '   '
  @symbol_2 = '  |'
  @symbol_3 = ' _|'
  @symbol_4 = '|_ '
  @symbol_5 = '|_|'

end

  attr_reader :symbol_1, :symbol_2, :symbol_3, :symbol_4, :symbol_5
    BLANK = ' '
    UNDERLINE = '_'
    BAR = '|'

  def number_one_in_symbols
    @number_one = [[c.symbol_1 + c.symbol_1 + c.symbol_1],[c.symbol_1 + c.symbol_1 + c.symbol_2], [c.symbol_1 + c.symbol_1 + c.symbol_2],[c.symbol_1 + c.symbol_1 + c.symbol_1]]
  end
  binding.pry
end
