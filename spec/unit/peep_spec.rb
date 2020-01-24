require 'peep'

describe Peep do
  describe '.all' do
    it 'returns a list of peeps' do
      connection = PG.connect(dbname: 'chitter_manager_test')

    # Add the test data
      connection.exec("INSERT INTO peeps (peep) VALUES ('This is my first peep!');")
      connection.exec("INSERT INTO peeps (peep) VALUES ('This is my second peep!');")
      connection.exec("INSERT INTO peeps (peep) VALUES ('This is my third peep!');")

      peeps = Peep.all

      expect(peeps).to include('This is my first peep!')
      expect(peeps).to include('This is my second peep!')
      expect(peeps).to include('This is my third peep!')
    end
  end
end