require 'peeps'

describe Peeps do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO peeps (message) VALUES('This is a peep!');")
      peeps = Peeps.all
      expect(peeps).to include("This is a peep!")
    end
  end

  describe '.post' do
    it 'returns all peeps' do
      Peeps.post(message: 'This is a peep!')
      expect(Peeps.all).to include 'This is a peep!'
    end
  end
end
