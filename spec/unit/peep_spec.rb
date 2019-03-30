require 'peep'
require 'pg'

describe Peep do
  describe '.create' do
    it 'creates a new peep' do
      expect(Peep.create("Hello, World!")).to be_a_kind_of(Peep)
    end
    it 'creates peep with correct content' do
      expect(Peep.create("Hello, World!").peep).to eq("Hello, World!")
    end
  end 

  describe '.all' do
    it 'prints out all peeps' do
      peep = Peep.create("Hello, World!")
      Peep.create("Second Peep")
      Peep.create("On a roll, MAGA")
      persisted_data = PG.connect(dbname: 'chitter_test').query("SELECT * FROM peeps WHERE id = #{peep.id};")

      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq persisted_data.first['id']
      expect(peeps.first.peeptime).to eq persisted_data.first['peeptime']
      expect(peeps.first.peep).to eq 'Hello, World!'
    end
  end
end
