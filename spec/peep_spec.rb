require 'peep'
require 'database_helpers'

describe Peep do
  describe '.create' do
    it 'creates a new Peep and adds it to the database' do
      peep = Peep.create(peep: "test")
      persisted_data = DatabaseConnection.query("SELECT * FROM peeps WHERE peep = '#{peep.peep}'")

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data.first['id']
      expect(peep.peep).to eq 'test'
    end
  end

end
