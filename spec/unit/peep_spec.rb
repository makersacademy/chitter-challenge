require 'peep'

describe Peep do
  describe '.all' do
    it 'shows all peeps' do
      connection = PG.connect(dbname: 'chitter_test', user: 'postgres', password: 'postgres')
      connection.exec("INSERT INTO peeps (peep) VALUES ('Its a beautiful day');")
      connection.exec("INSERT INTO peeps (peep) VALUES ('Get vaccinated. Wear a mask. Save lives.');")
      connection.exec("INSERT INTO peeps (peep) VALUES ('Happy Earth day');")
      
      peeps = Peep.all
      
      expect(peeps).to include('Its a beautiful day')
      expect(peeps).to include('Get vaccinated. Wear a mask. Save lives.')
      expect(peeps).to include('Happy Earth day')
    end

    describe '.post' do
      it 'posts a new peep' do
        Peep.post(peep: 'I love my life')

        expect(Peep.all).to include 'I love my life'
      end
    end
  
  end
end
