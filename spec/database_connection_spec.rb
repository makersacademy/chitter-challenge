describe DatabaseConnection do
  describe '.connection' do
    it 'sets up a connection to a database through PG' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_test')
      DatabaseConnection.connection
    end
  end
end