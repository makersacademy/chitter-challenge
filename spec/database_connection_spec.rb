describe DatabaseConnection do
  describe '.connection' do
    it 'sets up a connection to a database through PG' do
      expect(PG).to receive(:connect).with(dbname: 'chatter_test')
      DatabaseConnection.connection
    end
  end
end
