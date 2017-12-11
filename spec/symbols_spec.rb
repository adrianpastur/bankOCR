require_relative '../lib/symbols.rb'

describe Symbols do

  let(:symbols) { Symbols.new }

  it 'converts symbols to array of numbers' do
    expect(symbols.identify_numbers_from_symbols).to eq(["4", "9", "0", "0", "6", "7", "7", "1", "5"])
  end

  it 'converts entries to array of symbols' do
    expect(symbols.convert_entries_to_symbols(123456789)).to eq(symbols.entries_as_symbols)
  end

end
