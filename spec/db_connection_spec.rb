require 'db_connection'

describe DBConnection do
  describe '.connect' do
    it 'connects to an existing database' do
      expect { DBConnection.connect }.not_to raise_error
    end

    it 'errors if the database doesnt exist' do
      expect { DBConnection.connect('twit_test', 'twit') }.to raise_error PG::ConnectionBad
    end
  end

  describe '.disconnect' do
    it 'disconnects from an active connection' do
      DBConnection.connect
      expect { DBConnection.disconnect }.not_to raise_error
    end

    it 'errors if the connection is not active' do
      expect { DBConnection.disconnect }.to raise_error PG::ConnectionBad
    end
  end

  describe '.run_query' do
    it 'runs a well-formed query' do
      DBConnection.connect
      expect { DBConnection.run_query('SELECT * FROM peeps;') }.not_to raise_error
      DBConnection.disconnect
    end

    it 'errors for a badly-formed query' do
      DBConnection.connect
      expect { DBConnection.run_query('SELECT * FROM peeples;') }.to raise_error PG::UndefinedTable
    end
  end
end