require 'peep'
describe Peep do
  describe '.all' do
    it 'returns a list of peeps' do
      Peep.create(content: 'Test peep 1', time: '2020-08-01 12:00:00')
      peeps = Peep.all

      expect(peeps.first).to be_a(Peep)
      expect(peeps.first.content).to eq('Test peep 1')

    end
  end
  describe '.create' do
    it 'creates a new Peep and adds it to the database' do
      peep = Peep.create(content: 'Test peep 1', time: '2020-08-01 12:00:00')
      persisted_data = PG.connect(dbname: 'chitter_test').query("SELECT * FROM peeps WHERE id = '#{peep.id}';")
      expect(peep).to be_a(Peep)
      expect(peep.id).to eq(persisted_data.first['id'])
      expect(peep.content).to eq('Test peep 1')
    end
  end
end
