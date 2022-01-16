require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      peep = Peep.create(peep: "This is a peep")
      Peep.create(peep: "This is a second peep")
      Peep.create(peep: "Another peep!")
      
      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.print).to eq peep.print
    end
  end

  describe '.create' do
    it 'adds a peep to the database' do
      peep = Peep.create(peep: "This is a peep")
      connection = PG.connect dbname: 'chitter_web_test'
      result = connection.query("SELECT * FROM peeps WHERE id = #{peep.id};")

      peeps = Peep.all

      expect(peep).to be_a Peep
      expect(peep.print).to eq "This is a peep"
      expect(peep.id).to eq result.first['id']
    end
  end
end
