require_relative '../lib/chitter_connection'

describe 'ChitterConnection' do

  describe '.setup' do
      it 'should set-up a connection to test database' do
        expect(PG).to receive(:connect).with(dbname: 'chitter_test')
        ChitterConnection.setup('chitter_test')
      end
  end

  describe '.query' do
    it 'Executes sql query on test database' do
      connection = ChitterConnection.setup('chitter_test')
      sql = 'SELECT * FROM peeps;'
      expect(connection).to receive(:exec).with(sql)
      ChitterConnection.query(sql)
    end
  end

end
