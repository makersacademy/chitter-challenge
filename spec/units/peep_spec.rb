require 'peep'

describe Peep do
  describe '#initialize' do
    it 'stores id, body, and time' do
      peep = Peep.new(id: 1, body: "first peep", time: '2019-12-02 14:02:35')
      expect(peep.id).to eq(1)
      expect(peep.body).to eq("first peep")
      expect(peep.time).to eq('2019-12-02 14:02:35')
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

  describe '#all' do
    it 'should return array of Peep instances that exist in database' do
      peep = Peep.create(body: 'first peep')
      Peep.create(body: 'second peep')
      Peep.create(body: 'third peep')

      peeps = Peep.all
      db_first_peep = peeps.last

      expect(db_first_peep).to be_instance_of(Peep)
      expect(db_first_peep.id).to eq(peep.id)
      expect(db_first_peep.body).to eq(peep.body)
      expect(peeps.length).to eq(3)
    end
  end
end
