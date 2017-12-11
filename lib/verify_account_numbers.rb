require 'pry'
require_relative 'symbols.rb'
require_relative 'entries.rb'

class Verify

  def initialize
    @entries = Entries.new
    @accounts = entries.get_account_numbers
    @possible_solutions = []
    @solutions_counter = 0
  end

  attr_accessor :accounts, :solutions_counter, :possible_solutions
  attr_reader :entries, :reset_account


  def reprint_account_number
    verify_account_solution

  end

  def verify_account_solution
    number_of_accounts = accounts.count
    accounts_counter = 0

    while accounts_counter < number_of_accounts
      check_account_solutions(accounts[accounts_counter])
      if solutions_counter > 1
        p "#{accounts[accounts_counter]} AMB #{possible_solutions}"
      elsif solutions_counter == 1
        p "#{possible_solutions.join('')}"
      elsif solutions_counter == 0
        p "#{entries.print_account_numbers}"
      end
      accounts_counter += 1
    end
  end

  def check_account_solutions(account_being_checked)
    reset_account = account_being_checked
    if entries.is_valid(account_being_checked) == false
      number_counter = 0
      while number_counter < 9 do
        if account_being_checked[number_counter] == '1'
          account_being_checked[number_counter] = '7'
          check_account(account_being_checked)
          account_being_checked = reset_account
        elsif account_being_checked[number_counter] == '3'
          account_being_checked[number_counter] = '9'
          check_account(account_being_checked)
          account_being_checked = reset_account
        elsif account_being_checked[number_counter] == '4'
          account_being_checked[number_counter] = '9'
          check_account(account_being_checked)
          account_being_checked = reset_account
        elsif account_being_checked[number_counter] == '5'
          account_being_checked[number_counter] = '9'
          check_account(account_being_checked)
          account_being_checked = reset_account

          account_being_checked[number_counter] = '6'
          check_account(account_being_checked)
          account_being_checked = reset_account
        elsif account_being_checked[number_counter] == '6'
          account_being_checked[number_counter] = '8'
          check_account(account_being_checked)
          account_being_checked = reset_account

          account_being_checked[number_counter] = '8'
          check_account(account_being_checked)
          account_being_checked = reset_account
        elsif account_being_checked[number_counter] == '7'
          account_being_checked[number_counter] = '1'
          check_account(account_being_checked)
          account_being_checked = reset_account
        elsif account_being_checked[number_counter] == '8'
          account_being_checked[number_counter] = '0'
          check_account(account_being_checked)
          account_being_checked = reset_account

          account_being_checked[number_counter] = '6'
          check_account(account_being_checked)
          account_being_checked = reset_account

          account_being_checked[number_counter] = '9'
          check_account(account_being_checked)
          account_being_checked = reset_account
        elsif account_being_checked[number_counter] == '9'
          account_being_checked[number_counter] = '3'
          check_account(account_being_checked)
          account_being_checked = reset_account

          account_being_checked[number_counter] = '4'
          check_account(account_being_checked)
          account_being_checked = reset_account

          account_being_checked[number_counter] = '5'
          check_account(account_being_checked)
          account_being_checked = reset_account

          account_being_checked[number_counter] = '8'
          check_account(account_being_checked)
          account_being_checked = reset_account
        end
          number_counter += 1
      end
    else
      puts "account is valid: #{account_being_checked}"
    end
  end

  def check_account(account)
    solutions_counter = solutions_counter
    if entries.is_valid(account) == true
      @solutions_counter += 1
      possible_solutions << account
    else
      return false
    end
  end
  a = Verify.new
  binding.pry
end
