require 'database_connection'

describe DatabaseConnection do
  describe '::setup' do
    it 'sets up a connection to the specified database' do
      expect(described_class.setup('bookmark_manager_test')).to be_an_instance_of(PG::Connection)
    end
  end

  describe '::query' do
    it 'queries the table specified in setup with provided string' do
      described_class.setup('bookmark_manager_test')
      query_string = "SELECT url FROM links LIMIT 1;"
      expect(described_class.query(query_string)).to be_an_instance_of(PG::Result)
    end
  end

end
