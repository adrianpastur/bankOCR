require 'pry'
require_relative 'symbols.rb'
require_relative 'entries.rb'

class Verify

  def initialize
    @entries = Entries.new
    @accounts = entries.get_account_numbers
  end

  attr_accessor :solutions_counter, :possible_solutions
  attr_reader :entries, :reset_account, :accounts

  #User case 4 solution : verify_account_solution
  def verify_account_solution(passed_accounts)
    number_of_accounts = accounts.count
    accounts_counter = 0
    #  Marshal.load(Marshal.dump(passed_accounts)) creates a deep copy of the accounts passed in (passed_accounts) from the entries file.
    accounts_being_verified = Marshal.load(Marshal.dump(passed_accounts))
    while accounts_counter < number_of_accounts
      check_account_solutions(accounts_being_verified[accounts_counter])
      if solutions_counter > 1
        @possible_solutions = possible_solutions.each.map(&:to_i)
        puts "#{passed_accounts[accounts_counter].join('')} AMB #{possible_solutions}"
      elsif solutions_counter == 1
        puts "#{accounts_being_verified[0].join('')} ERR"
      elsif solutions_counter == 0
        puts "#{accounts_being_verified[0].join('')}"
      end
      accounts_counter += 1
    end
  end

  def check_account_solutions(account_being_checked)
    @possible_solutions = []
    @solutions_counter = 0
    reset_account = Marshal.load(Marshal.dump(account_being_checked))
    mutated_account = Marshal.load(Marshal.dump(account_being_checked))
    if entries.is_valid(mutated_account) == false
      number_counter = 0
      while number_counter < 9 do
        mutated_account = Marshal.load(Marshal.dump(account_being_checked))
        #a deep copy needed so only one number can be modified at a time.
        if mutated_account[number_counter] == '0'
          mutated_account[number_counter] = '8'
          check_account(mutated_account)
        elsif mutated_account[number_counter] == '1'
          mutated_account[number_counter] = '7'
          check_account(mutated_account)

        elsif mutated_account[number_counter] == '3'
          mutated_account[number_counter] = '9'
          check_account(mutated_account)

        elsif mutated_account[number_counter] == '5'
          mutated_account[number_counter] = '9'
          check_account(mutated_account)

          mutated_account[number_counter] = '6'
          check_account(mutated_account)

        elsif mutated_account[number_counter] == '6'
          mutated_account[number_counter] = '8'
          check_account(mutated_account)

          mutated_account[number_counter] = '8'
          check_account(mutated_account)

        elsif mutated_account[number_counter] == '7'
          mutated_account[number_counter] = '1'
          check_account(mutated_account)

        elsif mutated_account[number_counter] == '8'
          mutated_account[number_counter] = '0'
          check_account(mutated_account)

          mutated_account[number_counter] = '6'
          check_account(mutated_account)

          mutated_account[number_counter] = '9'
          check_account(mutated_account)

        elsif mutated_account[number_counter] == '9'
          mutated_account[number_counter] = '3'
          check_account(mutated_account)

          mutated_account[number_counter] = '5'
          check_account(mutated_account)

          mutated_account[number_counter] = '8'
          check_account(mutated_account)

        elsif mutated_account[number_counter] == '?'
          mutated_account[number_counter] = '0'
          check_account(mutated_account)

          mutated_account[number_counter] = '1'
          check_account(mutated_account)

          mutated_account[number_counter] = '2'
          check_account(mutated_account)

          mutated_account[number_counter] = '3'
          check_account(mutated_account)

          mutated_account[number_counter] = '4'
          check_account(mutated_account)

          mutated_account[number_counter] = '5'
          check_account(mutated_account)

          mutated_account[number_counter] = '6'
          check_account(mutated_account)

          mutated_account[number_counter] = '7'
          check_account(mutated_account)

          mutated_account[number_counter] = '8'
          check_account(mutated_account)

          mutated_account[number_counter] = '9'
          check_account(mutated_account)

        end
          number_counter += 1
      end
    elsif entries.is_valid(mutated_account) == true
      puts "account is valid: #{account_being_checked}"
    end
  end

  def check_account(account_to_check)
    valid_account = account_to_check
    if entries.is_valid(valid_account) == true
      @solutions_counter += 1
      possible_solutions << valid_account.join('')
    else
      return false
    end
  end
end
