require 'DB_connection'

RSpec.describe DBconnection do
  describe '.setup' do
    it 'sets up a con to a DB through PG' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_test')
      DBconnection.setup('chitter_test')
    end
  end

  describe '.con' do
    it 'this connection is persistent' do
      con = DBconnection.setup('chitter_test')
      expect(DBconnection.con).to eq con
    end
  end

  describe '.query' do
    it 'executes a query via PG' do
      con = DBconnection.setup('chitter_test')
      expect(con).to receive(:exec).with("SELECT * FROM peeps;")
      DBconnection.query("SELECT * FROM peeps;")
    end
  end
end
