require 'peep'

describe Peep do
  subject(:peep) { described_class.new(1, "Example Peep Content", 5, "just now") }

  it 'stores an id' do
    expect(peep.id).to eq 1
  end

  it 'stores the content' do
    expect(peep.content).to eq "Example Peep Content"
  end

  it 'stores the maker_id of the author' do
    expect(peep.maker_id).to eq 5
  end

  it 'stores the timestamp of peep creation' do
    expect(peep.created).to eq "just now"
  end
end
