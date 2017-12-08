require 'pry'

class Symbols

  def initialize
    @symbol_1 = '   '
    @symbol_2 = '  |'
    @symbol_3 = ' _|'
    @symbol_4 = '|_ '
    @symbol_5 = '|_|'
    @symbol_6 = '| |'
    @symbol_7 = ' _ '
    numbers_from_symbols_for_verifying
    @test_1 = [['   ', ' _ ', ' _ ', ' _ ', ' _ ', ' _ ', ' _ ', '   ', ' _ '],
              [ '|_|', '|_|', '| |', '| |', '|_ ', '  |', '  |', '  |', '|_ '],
              [ '  |', ' _|', '|_|', '|_|', '|_|', '  |', '  |', '  |', ' _|']]
  end
  attr_accessor :test_1, :number_from_symbol
  attr_reader :symbol_1, :symbol_2, :symbol_3, :symbol_4, :symbol_5, :symbol_6, :symbol_7
  attr_reader :number_one, :number_two, :number_three, :number_four, :number_five,
   :number_six, :number_seven, :number_eight, :number_nine, :number_zero

  def numbers_from_symbols_for_verifying
    @number_zero = symbol_7 + symbol_6 + symbol_5
    @number_one = symbol_1 + symbol_2 + symbol_2
    @number_two = symbol_7 + symbol_3 + symbol_4
    @number_three = symbol_1 + symbol_3 + symbol_3
    @number_four = symbol_1 + symbol_5 + symbol_2
    @number_five = symbol_7 + symbol_4 + symbol_3
    @number_six = symbol_7 + symbol_4 + symbol_5
    @number_seven = symbol_7 + symbol_2 + symbol_2
    @number_eight = symbol_7 + symbol_5 + symbol_5
    @number_nine = symbol_7 + symbol_5 + symbol_3
  end

  def identify_numbers_from_symbols
    index = 0
    @number_from_symbol = []
    while index < 9 do
        if number_from_array(index) == number_zero
          number_from_symbol << '0'
        elsif number_from_array(index) == number_one
          number_from_symbol << '1'
        elsif number_from_array(index) == number_two
          number_from_symbol << '2'
        elsif number_from_array(index) == number_three
          number_from_symbol << '3'
        elsif number_from_array(index) == number_four
          number_from_symbol << '4'
        elsif number_from_array(index) == number_five
          number_from_symbol << '5'
        elsif number_from_array(index) == number_six
          number_from_symbol << '6'
        elsif number_from_array(index) == number_seven
          number_from_symbol << '7'
        elsif number_from_array(index) == number_eight
          number_from_symbol << '8'
        elsif number_from_array(index) == number_nine
          number_from_symbol << '9'
        end
        index += 1
      end
      return number_from_symbol
  end

  def number_from_array(index)
    number_to_check = test_1[0][index] + test_1[1][index] + test_1[2][index]
  end
end
