require 'db_connection'
require 'pg'

describe DBConnection do
  describe '.query' do
    it 'runs a well-formed query' do
      expect { DBConnection.query('SELECT * FROM peeps;') }.not_to raise_error
    end

    it 'errors for a badly-formed query' do
      expect { DBConnection.query('SELECT * FROM peeples;') }.to raise_error PG::UndefinedTable
    end

    it 'errors if it cant connect to the db' do
      allow(PG).to receive(:connect).and_raise StandardError
      expect { DBConnection.query('SELECT * FROM peeps;') }.to raise_error StandardError
    end
  end
end
