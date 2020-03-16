require 'peep'
require 'database_helpers'

describe Peep do
  describe '.all' do
    it 'returns a list of peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      peep = Peep.create(peeps: "First Peep", author: "Swarbzz")
      Peep.create(peeps: "Second Peep", author: "Swarbzz")
      Peep.create(peeps: "Third Peep", author: "Swarbzz")

      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.author).to eq 'Swarbzz'
      expect(peeps.first.peeps).to eq 'First Peep'
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      peep = Peep.create(peeps: 'Hello there', author: 'Swarbzz')
      persisted_data = PG.connect(dbname: 'chitter_test').query("SELECT * FROM peeps WHERE id = #{peeps.id};")

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data['id']
      expect(peep.author).to eq 'Swarbzz'
      expect(peep.peeps).to eq 'Hello there'
    end
  end
end
