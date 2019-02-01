require 'database_connection'

describe DatabaseConnection do

  let(:connection_double) { double(:connection_double, exec: nil )}
  let(:pg_double) { double(:pg_double, connect: connection_double) }
  let (:db_name) { 'chitter_testing' }

  describe '#setup' do
    it 'should establish a connection to the given database' do
      DatabaseConnection.connect(db_name, pg_double)
      expect(DatabaseConnection.database).to eq connection_double
    end

    it 'should send request to pg' do
      expect(pg_double).to receive(:connect)
      DatabaseConnection.connect(db_name, pg_double)
    end
  end

  describe '#query' do
    it 'should send SQL query to pg' do
      DatabaseConnection.connect(db_name, pg_double)
      expect(connection_double).to receive(:exec)
      DatabaseConnection.query("some sql")
    end
  end
end
