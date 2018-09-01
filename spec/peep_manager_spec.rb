require 'peep_manager.rb'

describe Peeps do
  describe '.all' do
    it 'returns a list of peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      Peeps.create("Peep test one")
      Peeps.create("Peep test two")
      Peeps.create("Peep test three")

      peeps = Peeps.all

      expect(peeps.length).to eq 3
      expect(peeps[0].values[1]).to eq 'Peep test one'
    end
  end

  describe '.create' do
    it 'creates the peep' do
      Peeps.create('Test peep')
      peep = Peeps.all
      expect(peep[0].values[1]).to eq 'Test peep'
    end
  end

  describe '.create' do
    it 'creates a timestamp for a peep' do
      allow(Peeps).to receive(:created_time).and_return "September 1, 2018 at 12:11 PM"
      Peeps.create('Test peep')
      peep = Peeps.all
      expect(peep[0].values[2]).to eq "September 1, 2018 at 12:11 PM"
    end
  end
end
