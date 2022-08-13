require 'peep'
describe Peep do
  describe '.all' do
    it 'returns a list of peeps' do
      connection = PG.connect(dbname: 'chitter_app_test')

      # Adding the tst peeps data
      connection.exec("INSERT INTO peeps (peep) VALUES ('Hello World');")
      peeps = Peep.all
      expect(peeps).to include('Hello World')
    end
  end
  describe '.new_peep' do
    it 'creates a new peep' do
      connection = PG.connect(dbname: 'chitter_app_test')
      Peep.new_peep(peep: 'Test_text')
      expect(Peep.all).to include('Test_text')
    end
  end
end
