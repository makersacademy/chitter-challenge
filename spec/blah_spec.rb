require 'blah'

describe Blah do
  describe '.all' do
    it 'returns a array' do
      expect(Blah.all).to be_a(Array)
    end

    it 'displays all blahs' do
      blahs = Blah.all
      blahs_array = blahs.map(&:blah)

      expect(blahs_array).to include('One blah')
      expect(blahs_array).to include('Two blah')
      expect(blahs_array).to include('Three blah')
    end
  end

  describe '.create' do
    it 'enters a new blah into the database' do
      Blah.create("A unit test blah")

      expect(Blah.all.last.blah).to eq('A unit test blah')
    end
  end
end
