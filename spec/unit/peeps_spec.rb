require 'peeps'
require 'database_helpers'

describe Peeps do
  context '.all' do
    it 'retuns the peeps' do
      PG.connect(dbname: 'chitter_test')

      peep = Peeps.create(content: 'My first peep')
      Peeps.create(content: 'My second peep')
      peeps = Peeps.all
      expect(peeps.length).to eq 2
      expect(peeps.first).to be_a Peeps
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.content).to eq 'My first peep'

    end
  end

  context '.create' do
    it 'create a new peep' do
      peep = Peeps.create(content: 'My first peep')
      persisted_data = persisted_data(table: 'peeps', id: peep.id)

      expect(peep).to be_a Peeps
      expect(peep.id).to eq persisted_data.first['id']
      expect(peep.content).to eq 'My first peep'
    end
  end
end
