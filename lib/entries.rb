require 'pry'
require_relative 'symbols.rb'

class Entries

  def initialize
    @symbols = Symbols.new
    @account_number = symbols.identify_numbers_from_symbols
    position_names
  end

  attr_reader :symbols, :account_number
  attr_reader :d1, :d2, :d3, :d4, :d5, :d6, :d7, :d8, :d9

  def position_names
    @d1 = account_number[8].to_i
    @d2 = account_number[7].to_i
    @d3 = account_number[6].to_i
    @d4 = account_number[5].to_i
    @d5 = account_number[4].to_i
    @d6 = account_number[3].to_i
    @d7 = account_number[2].to_i
    @d8 = account_number[1].to_i
    @d9 = account_number[0].to_i
  end

  def checksum_calculation
    d = 9
    e = 0
    total = 0
    until d == 1 do
      total += account_number[e].to_i * d
      d -= 1
      e += 1
    end
    total += account_number[8].to_i
    return total
  end

  def is_valid(checksum_calculation)
    return true if checksum_calculation % 11 == 0
  end

binding.pry
end
