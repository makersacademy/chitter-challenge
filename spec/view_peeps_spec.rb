require 'peep'
require 'pg'

describe Peep do

  describe '.all' do
    it 'returns a list of peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO peep_manager (peep) VALUES ('hello world');")
      peep = Peep.all

      expect(peep).to include "hello world"
    end
  end
end
