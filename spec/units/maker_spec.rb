require 'maker'

describe Maker do

  let(:maker) { Maker.create(
    :displayname => 'Big Sam',
    :username => 'samuel2000') }
  let(:peep) { maker.peeps.create(
    :peeptext => "Test peep!",
    :timestamp => Time.new) }

  describe '#create' do
    it 'returns a Maker' do
      expect(maker).to be_a Maker
    end

    it 'puts the new data in the database' do #Is this the right way to test database functionality?
      expect(maker.displayname).to eq 'Big Sam'
      expect(maker.username).to eq 'samuel2000'
    end
  end

  describe '#peeps.create' do
    it 'creates a new Peep instance' do
      expect(peep).to be_a Peep
    end

    it 'has Peep class put the new peep in the database with connection to the right Maker' do
      expect(peep.peeptext).to eq 'Test peep!'
      expect(peep.maker_id).to eq maker.id
    end
  end

  describe '#peeps' do
    it 'returns a list of peep objects' do
      maker.peeps.create(
        :peeptext => "new peep time!",
        :timestamp => Time.new)
        expect(maker.peeps.first).to be_a Peep
    end
  end

  describe '#get' do
    it 'returns a specific maker record' do
      expect(
        Maker.get(maker.id)
      ).to eq maker
    end
  end

end
