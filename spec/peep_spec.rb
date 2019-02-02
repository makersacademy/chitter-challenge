require './app/lib/peep'
require 'pg'

RSpec.describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      # connection = PG.connect(dbname: 'chitter_test')
      Peep.create(peep: 'I ate some cake')
      p Peep.all
      expect(Peep.all.first.peep).to eq('I ate some cake')
      expect(Peep.all.length).to eq(1)
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      first_peep = Peep.create(peep: 'I ate some cake')
      expect(first_peep).to be_a(Peep)
      expect(first_peep.peep).to eq('I ate some cake')
      expect(first_peep.id).to eq('1')
    end
  end
end
