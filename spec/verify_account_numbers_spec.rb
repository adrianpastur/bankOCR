require_relative '../lib/verify_account_numbers.rb'

describe Verify do

  let(:verify) { Verify.new }

  it 'check accounts which are not valid with multiple possible solutions' do
    expect{verify.verify_account_solution(verify.accounts)}.to output("490067715 AMB [490867715, 490067115, 490067719]\n").to_stdout
  end

  it 'check accounts which are not valid with one possible solution' do
    expect{verify.verify_account_solution([["490867715"]])}.to output("490867715\n").to_stdout
  end


end
