require 'pry'

class Entries

  def initialize(account_number)
    @account_number
    @account_number_display = []
  end

  attr_accessor :account_number

  def display_digits(account_number)
    account_number_array = account_number.split('')
  end
end
