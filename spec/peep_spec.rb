require 'peep'

describe Peep do

  describe '.all' do
    it 'retrieves all peeps in reverse chronological order' do
      connection = PG.connect(dbname: 'chitter_test')

      peep = Peep.all.last
      expect(peep).to eq('my first peep, hurray!')
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      Peep.create(peep: 'my first peep, hurray!')
      expect(Peep.all).to include('my first peep, hurray!')
    end
  end
end
