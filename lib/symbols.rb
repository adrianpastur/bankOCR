require 'pry'

#Symbols class is the answer for the user case 1
class Symbols

  def initialize
    @entry = 0
    @symbol_1 = '   '
    @symbol_2 = '  |'
    @symbol_3 = ' _|'
    @symbol_4 = '|_ '
    @symbol_5 = '|_|'
    @symbol_6 = '| |'
    @symbol_7 = ' _ '
    numbers_from_symbols_for_verifying
    #following is a default array used to test the app.
    @entries_as_symbols = [['   ', ' _ ', ' _ ', ' _ ', ' _ ', ' _ ', ' _ ', '   ', ' _ '],
                          [ '|_|', '|_|', '| |', '| |', '|_ ', '  |', '  |', '  |', '|_ '],
                          [ '  |', ' _|', '|_|', '|_|', '|_|', '  |', '  |', '  |', ' _|']]
  end
  attr_accessor :entries_as_symbols, :converted_number
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

  #converts numbers to symbols
  def convert_entries_to_symbols(entry)
    entry = entry.to_s.chars.map(&:to_i)
    numbers_to_symbols_helper = ''
    entry.each_with_index do |x, index|
      numbers_to_symbols_helper = check_number_from_entry(x)

      entries_as_symbols[0][index] = send_three_symbols(numbers_to_symbols_helper, 0)

      entries_as_symbols[1][index] = send_three_symbols(numbers_to_symbols_helper, 1)

      entries_as_symbols[2][index] = send_three_symbols(numbers_to_symbols_helper, 2)
    end
    entries_as_symbols
  end

  def send_three_symbols(numbers_to_symbols_helper, counter)
    counter = counter
    if counter == 0
      numbers_to_symbols_helper[0] + numbers_to_symbols_helper[1] + numbers_to_symbols_helper[2]
    elsif counter == 1
      numbers_to_symbols_helper[3] + numbers_to_symbols_helper[4] + numbers_to_symbols_helper[5]
    elsif counter == 2
      numbers_to_symbols_helper[6] + numbers_to_symbols_helper[7] + numbers_to_symbols_helper[8]
    end
  end

  def check_number_from_entry(value)
    if value == 0
      number_zero
    elsif value == 1
      number_one
    elsif value == 2
      number_two
    elsif value == 3
      number_three
    elsif value == 4
      number_four
    elsif value == 5
      number_five
    elsif value == 6
      number_six
    elsif value == 7
      number_seven
    elsif value == 8
      number_eight
    elsif value == 9
      number_nine
    end
  end

#returns number as array from array of symbols.
  def identify_numbers_from_symbols
    index = 0
    @converted_number = []
    while index < 9 do
        if number_from_symbols(index, entries_as_symbols) == number_zero
          converted_number << '0'
        elsif number_from_symbols(index, entries_as_symbols) == number_one
          converted_number << '1'
        elsif number_from_symbols(index, entries_as_symbols) == number_two
          converted_number << '2'
        elsif number_from_symbols(index, entries_as_symbols) == number_three
          converted_number << '3'
        elsif number_from_symbols(index, entries_as_symbols) == number_four
          converted_number << '4'
        elsif number_from_symbols(index, entries_as_symbols) == number_five
          converted_number << '5'
        elsif number_from_symbols(index, entries_as_symbols) == number_six
          converted_number << '6'
        elsif number_from_symbols(index, entries_as_symbols) == number_seven
          converted_number << '7'
        elsif number_from_symbols(index, entries_as_symbols) == number_eight
          converted_number << '8'
        elsif number_from_symbols(index, entries_as_symbols) == number_nine
          converted_number << '9'
        else
          converted_number << '?'
        end
        index += 1
      end
       converted_number
  end

  def number_from_symbols(index, entries_as_symbols)
    number_to_check = entries_as_symbols[0][index] + entries_as_symbols[1][index] + entries_as_symbols[2][index]
  end
end
