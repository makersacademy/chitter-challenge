require 'peep'

describe Peep do
  subject(:peep) { described_class.new(1, "Example Peep Content", 5, "2022-03-20 19:31:52.789054+00") }

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
    expect(peep.created).to eq DateTime.parse("2022-03-20 19:31:52.789054+00")
  end

  describe '#format_time' do
    it 'returns a formatted time' do
      expect(peep.format_time).to eq '19:31'
    end
  end
end
