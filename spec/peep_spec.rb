require 'peep'
require 'database_helpers'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      # Add the test data
      time = Time.new.to_s[0...-6]

      peep = Peep.create(message: "Test peep 1")
      Peep.create(message: "Test peep 2")
      Peep.create(message: "Test peep 3")

      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.message).to eq 'Test peep 1'
      expect(peeps.first.created_at).to eq time
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      time = Time.new.to_s[0...-6]
      peep = Peep.create(message: "Test peep 1")
      persisted_data = PG.connect(dbname: 'chitter_test').query("SELECT * FROM peeps WHERE id = #{peep.id};")
  
      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data.first['id']
      expect(peep.message).to eq 'Test peep 1'
      expect(peep.created_at).to eq time
    end
  end
end