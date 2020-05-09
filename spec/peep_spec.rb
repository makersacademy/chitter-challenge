require 'peep'

describe Peep do
  describe '.all' do
    it 'lists all peeps' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO peeps (content) VALUES ('Summer is here yay');")
      peeps = Peep.all
      expect(peeps).to include 'Summer is here yay'
    end
  end

  describe '.create' do
    it 'adds new peep' do
      Peep.create('Zsofi', 'Test')
      peeps = Peep.all
      expect(peeps).to include 'Test'
    end
  end
end
