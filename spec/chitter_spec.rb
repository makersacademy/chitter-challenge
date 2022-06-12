require 'chitter'

RSpec.describe 'Chitter' do
  describe '.all' do
    it 'returns the list of peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO peeps (text) VALUES('peep_1');")
      connection.exec("INSERT INTO peeps (text) VALUES('peep_2');")
      connection.exec("INSERT INTO peeps (text) VALUES('peep_3');")
      
      peeps = Chitter.all

      expect(peeps).to include "peep_1"
      expect(peeps).to include "peep_2"
      expect(peeps).to include "peep_3"
    end
  end
end

