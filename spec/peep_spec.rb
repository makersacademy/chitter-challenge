require 'peep'

describe Peep do
  describe '.all' do
    it 'returns a list of peeps' do
      con = PG.connect(dbname: 'chitter_test')

      con.exec("INSERT INTO peeps VALUES(1, 'Alister', 'First peep');")
      con.exec("INSERT INTO peeps VALUES(2, 'Oliver', 'Second peep');")

      peeps = Peep.all

      expect(peeps).to include('First peep')
      expect(peeps).to include('Second peep')

    end
  end

  describe '.create' do
    it 'creates a new peep' do
      Peep.create(user_name: 'test_user', message: 'Test peep')

      expect(Peep.all).to include 'Test peep' 
    end
  end
end
