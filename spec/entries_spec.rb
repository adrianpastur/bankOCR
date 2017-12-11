require_relative '../lib/entries.rb'

describe Entries do

  let(:entries) { Entries.new }

  it 'checks valid account number' do
    expect(entries.is_valid(entries.get_account_numbers[0])).to eq(false)
  end

  it 'prints account numbers with ERR' do
    expect { entries.print_account_numbers }.to output("490067715 ERR\n").to_stdout
  end



  it 'prints account numbers with ILL' do
    entries.symbols.entries_as_symbols = [['   ', ' _ ', ' _ ', ' _ ', ' _ ', ' _ ', ' _ ', '   ', ' _ '],
              [ '|_|', '| |', '| |', '| |', '|_ ', '  |', '  |', '  |', '|_ '],
              [ '  |', ' _|', '|_|', '|_|', '|_|', '  |', '  |', '  |', ' _|']]
    expect { entries.print_account_numbers }.to output("4?0067715 ILL\n").to_stdout
  end

  it 'prints valid account number' do
    entries.symbols.convert_entries_to_symbols(345882865)
    expect { entries.print_account_numbers }.to output("345882865\n").to_stdout
  end
end
