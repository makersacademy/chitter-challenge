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
    it 'creates the bookmark' do
      Peeps.create('Test peep')
      peep = Peeps.all
      expect(peep[0].values[1]).to eq 'Test peep'
    end
  end
end
