describe DatabaseConnection do
  describe '.setup' do
    it 'creates a connection through PG' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_test')
      described_class.setup('chitter_test')
    end
  end

  describe '.query' do
    it 'runs query using the connection created by .setup' do
      connection = described_class.setup('chitter_test')
      expect(connection).to receive(:exec).with('SELECT * FROM users;')

      described_class.query('SELECT * FROM users;')
    end
  end
end
