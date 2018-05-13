require 'database'

describe Database do
  describe '.setup' do
    it 'sets up a connection to a database through PG' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_test')
      Database.setup('chitter_test')
    end

    it 'this connection is persistent' do
      con = Database.setup('chitter_test')
      expect(Database.con).to eq con
    end
  end

end
