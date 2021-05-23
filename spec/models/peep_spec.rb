require 'peep'

describe Peep do
  describe '::all' do
    it 'returns all peeps' do
      now = Time.now.strftime("%F %T")
      peep = Peep.create(text: 'test peep 1', posted: now)
      Peep.create(text: 'test peep 2', posted: now)
      Peep.create(text: 'test peep 3', posted: now)

      peeps = Peep.all

      expect(peeps.length).to eq(3)
      expect(peeps.first).to be_a(Peep)
      expect(peeps.first.id).to eq(peep.id)
      expect(peeps.first.text).to eq('test peep 1')
      expect(peeps.first.posted).to eq(now)
    end
  end

  describe '::create' do
    it 'adds a new peep' do
      now = Time.now.strftime("%F %T")
      peep = Peep.create(text: 'this is a new test peep', posted: now)
      persisted_data = PG.connect(dbname: 'chitter_test').query("SELECT * FROM peeps WHERE id = #{peep.id};")

      expect(peep).to be_a(Peep)
      expect(peep.id).to eq(persisted_data[0]['id'])
      expect(peep.text).to eq('this is a new test peep')
      expect(peep.posted).to eq(now)
    end
  end
end