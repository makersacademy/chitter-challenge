require 'database_connection'

RSpec.describe DatabaseConnection do
  describe '.setup' do
    it 'sets up a connection to a database through PG' do
      expect(PG).to receive(:connect).with(dbname: 'squiggler_test')

      DatabaseConnection.setup('squiggler_test')
    end
  end

  describe '.query' do
    it 'executes a query via PG' do
      connection = DatabaseConnection.setup('squiggler_test')

      expect(connection).to receive(:exec).with("SELECT * FROM squiggles;")

      DatabaseConnection.query("SELECT * FROM squiggles;")
    end
  end
end
