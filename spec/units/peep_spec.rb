require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO peeps (content) VALUES('test peep');")
      connection.exec("INSERT INTO peeps (content) VALUES('another test peep');")
      connection.exec("INSERT INTO peeps (content) VALUES('a third test peep');")

      peeps = Peep.all
      
      expect(peeps).to include("test peep")
      expect(peeps).to include("another test peep")
      expect(peeps).to include("a third test peep")
    end
  end

  describe '.create' do
    it 'posts a new peep' do
      Peep.create(content: 'newest peep')

      expect(Peep.all).to include 'newest peep'
    end
  end
end
