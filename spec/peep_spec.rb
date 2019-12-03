require './lib/peep'

describe Peep do
  describe '#initialize' do
    it 'stores id and message' do
      peeps = Peep.new(id: 1, message: 'Hello!!This is my first peep!')
      expect(peeps.id).to eq(1)
      expect(peeps.message).to eq('Hello!!This is my first peep!')
    end
  end

  describe '#create' do
    it 'creates a new peep entry in the Chitter database' do
      peeps = Peep.create(message: 'Hello!!This is my first peep!')
      connection = PG.connect(dbname: 'chitter_test')
      peeps = connection.query("SELECT * FROM peep WHERE id = #{peeps.id};")

      expect(peeps.id).to eq(peep.first['id'])
      expect(peeps.message).to eq('Hello!!This is my first peep!')
    end
  end
end
