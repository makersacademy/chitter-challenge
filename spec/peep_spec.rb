require 'peep'

describe Peep do

  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      Peep.create(message: "This is my peep!", time: Time.now)
      Peep.create(message: "Another peep", time: Time.now)
      Peep.create(message: "Third peep", time: Time.now)
      
      peeps = Peep.all

      expect(peeps.count).to eq(3)
      expect(peeps[0]).to be_a Peep
      expect(peeps[0].message).to eq('Third peep')
    end
  end

  describe '.create' do
    it 'adds a peep to the database' do
      Peep.create(message: 'Hello, this is a test peep', time: Time.now)
      peeps = Peep.all
      expect(peeps[0].message).to eq('Hello, this is a test peep')
    end
  end

end
