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
      Blah.create('A unit test blah', 'UnitTest')

      expect(Blah.all.first.blah).to eq('A unit test blah')
      expect(Blah.all.first.username).to eq('UnitTest')
    end

    it 'does not enter a empty blah into the database' do
      expect(Blah.create('', 'UnitTest')).to eq(false)
    end
  end

  describe '.delete' do
    it 'deletes a blah' do
      Blah.create('Delete this blah', 'UnitTest')
      blah_id = Blah.all.first.id
      blah_username = Blah.all.first.username

      Blah.delete(blah_id, blah_username)
      expect(Blah.all.first.blah).not_to eq('Delete this blah')
    end

    it 'only allows the user who posted the blah to delete it' do
      Blah.create('Delete this blah', 'UnitTest')
      blah_id = Blah.all.first.id
      blah_username = 'FakeUser'

      Blah.delete(blah_id, blah_username)
      expect(Blah.all.first.blah).to eq('Delete this blah')
    end
  end
end
