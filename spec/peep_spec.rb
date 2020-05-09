require 'peep'

describe Peep do
  describe '.all' do
    it 'lists all peeps' do
      #connection = PG.connect(dbname: 'chitter_test')
      peep = Peep.create(author: 'Zsofi', content: 'Test')
      peep2 = Peep.create(author: 'Ricky', content: 'Test2')
      peeps = Peep.all
      expect(peeps.length).to eq 2
      expect(peeps.first).to be_a Peep
      expect(peeps.first.author).to eq 'Ricky'
      expect(peeps.first.content).to eq 'Test2'
    end
  end

  describe '.create' do
    it 'adds new peep' do
      #connection = PG.connect(dbname: 'chitter_test')
      peep = Peep.create(author: 'Zsofi', content: 'Test')
      expect(peep).to be_a Peep
      expect(peep.author).to eq 'Zsofi'
      expect(peep.content).to eq 'Test'
    end
  end
end
