require 'peep'
require 'pg'

describe Peep do
  describe '.create' do
    it 'creates a new peep' do
      peep = Peep.create(text: 'Here is a test peep')
      connection = PG.connect(dbname: 'chitter_test')
      persisted_data = connection.exec("SELECT * FROM peeps WHERE id = '#{peep.id}';").first

      expect(peep).to be_a(Peep)
      expect(peep.id).to eq(persisted_data['id'])
      expect(peep.text).to eq('Here is a test peep')
    end
  end
end
