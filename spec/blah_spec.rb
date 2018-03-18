require 'blah'
require 'time'

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

    it 'returns data in a DESC sorted format' do
      blahs = Blah.all
      blahs_array = blahs.map(&:date)

      first_blah_date, last_blah_date = Time.parse(blahs_array.first), Time.parse(blahs_array.last)

      expect(first_blah_date > last_blah_date).to eq(true)
      expect(first_blah_date < last_blah_date).to eq(false)
    end
  end

  describe '.create' do
    it 'enters a new blah into the database' do
      Blah.create('A unit test blah')

      expect(Blah.all.first.blah).to eq('A unit test blah')
    end

    it 'does not enter a empty blah into the database' do
      expect(Blah.create('')).to eq(false)
    end
  end
end
