require './app/lib/peep'
require 'pg'

RSpec.describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      # connection = PG.connect(dbname: 'chitter_test')
      Peep.create(peep: 'I ate some cake')
      expect(Peep.all.first.peep).to eq('I ate some cake')
    end
  end
end
