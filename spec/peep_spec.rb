require 'peep'


describe Peep do
  describe '.create' do
    it 'creates a new peep' do
      peep = Peep.create(content: 'hello world')
      persisted_data = PG.connect(dbname: 'chitter_test').query("SELECT * FROM peeps WHERE id = #{peep.id};")
      expect(peep).to be_a Peep
      expect(peep.content).to eq 'hello world'
      expect(peep.id).to eq persisted_data.first['id']
    end
  end

  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')
      peep = Peep.create(content: 'hello')
      sleep 1
      Peep.create(content: 'world')
      sleep 1
      Peep.create(content: 'again')

      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.last).to be_a Peep
      expect(peeps.last.id).to eq peep.id
      expect(peeps.last.content).to eq 'hello'
    end
  end

  describe '.sort_chronologically' do
    it 'returns tweets in reverse chronological order' do
      connection = PG.connect(dbname: 'chitter_test')
      Peep.create(content: 'hello')
      Peep.create(content: 'world')
      Peep.create(content: 'again')


      peeps = Peep.all
      p peeps
    end
  end
end
