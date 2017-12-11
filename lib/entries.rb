require 'pry'
require_relative 'symbols.rb'

class Entries

  def initialize
    @symbols = Symbols.new
    @entry = 0
    @entries_as_symbols = [[],[],[]]
    @account_numbers = []
  end

  attr_accessor :entry, :account_numbers
  attr_reader :symbols, :entries_as_symbols


# code to validate entry before passing it to symbols.rb
  # def entry_validation(entry)
  #   entry_number_of_digits(entry)
  #   true
  # rescue
  #   puts 'Exception intercepted. 9 digit number required.'
  #   false
  # end
  #
  # def entry_number_of_digits(entry)
  #   return true if entry.entry.to_s.chars.map(&:to_i).count != 9
  # end

  def print_account_numbers
    ac_nmb = get_account_numbers
    ac_nmb.each do |subarray|
      if contains_question_mark(subarray) == true
        a = subarray.join('') + ' ILL'
        puts a
      elsif is_valid(subarray) == true
        a = subarray.join('')
        puts a
      else
         a = subarray.join('') + ' ERR'
         puts a
      end
    end
  end

  def contains_question_mark(subarray)
    subarray.each do |x|
    return true  if x == '?'
    end
  end

  def get_account_numbers
    account_numbers << symbols.identify_numbers_from_symbols
  end

  def checksum_calculation(account_number)
    number_index = 9
    counter = 0
    total = 0
    until number_index == 1 do
      total += account_number[counter].to_i * number_index
      number_index -= 1
      counter += 1
    end
    total += account_number[8].to_i
    total
  end

  def is_valid(subarray)
    return true if checksum_calculation(subarray) % 11 == 0 else false
  end
end
