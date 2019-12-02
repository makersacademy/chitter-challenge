require 'peep'

describe Peep do
  describe '#initialize' do
    it 'stores id and body' do
      peep = Peep.new(id: 1, body: "first peep")
      expect(peep.id).to eq(1)
      expect(peep.body).to eq("first peep")
    end
  end

  describe '#create' do
    it 'creates a new peep entry in the Chitter database' do
      peep = Peep.create(body: 'first peep')
      db = PG.connect(dbname: 'chitter_test')
      peeps = db.query("SELECT * FROM peeps WHERE id = #{peep.id};")

      expect(peep.id).to eq(peeps.first['id'])
      expect(peep.body).to eq('first peep')
    end
  end
end
