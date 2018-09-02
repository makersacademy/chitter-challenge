require 'peep'

describe Peep do

  describe '.all' do
    it 'retrieves all peeps in reverse chronological order' do
      connection = PG.connect(dbname: 'chitter_test')

      peep = Peep.all.last
      expect(peep).to be_a Peep
      expect(peep).to respond_to(:id)
      expect(peep.peep).to eq('my first peep, hurray!')
      expect(peep).to respond_to(:time)
    end
  end

  describe '.create' do
    it 'creates a new peep with the time' do
      Peep.create(peep: 'my first peep, hurray!')

      peep = Peep.all.first
      expect(peep.peep).to eq('my first peep, hurray!')
      expect(peep).to respond_to(:time)
    end
  end
end
