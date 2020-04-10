require 'peep'
require 'pg'

describe Peep do
  describe '.all' do
    it 'returns a list of all peeps' do
      conn = PG.connect(dbname: 'chitter_test')
      conn.exec("INSERT INTO peeps (text, time) VALUES ('My first peep', NOW());")
      conn.exec("INSERT INTO peeps (text, time) VALUES ('My second peep', NOW());")
      conn.close
      peeps = Peep.all
      expect(peeps.length).to eq 2
      expect(peeps[0]).to eq 'My first peep'
      expect(peeps[1]).to eq 'My second peep' 
    end
  end
end
