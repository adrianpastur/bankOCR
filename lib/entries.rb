require 'pry'
require_relative 'symbols.rb'

class Entries

  def initialize
    @symbols = Symbols.new
    @account_number = symbols.identify_numbers_from_symbols
    position_names
  end

  attr_reader :symbols, :account_number

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
