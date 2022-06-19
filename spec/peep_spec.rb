require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_chatter_test')

      connection.exec("INSERT INTO peeps (content, user_id) VALUES ('This is my first peep', 'First');")

      peeps = Peep.all.to_s

      expect(peeps).to include("This is my first peep")
      
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      Peep.create(content: 'This is a test')

      expect(Peep.all.to_s).to include 'This is a test'
    end
  end

end
