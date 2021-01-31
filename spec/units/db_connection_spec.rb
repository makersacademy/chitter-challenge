describe DBConnection do

  describe '.setup' do
    it 'sets up PG connection' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_test')
      described_class.setup('chitter_test')
    end
  end

  describe '.connection' do
    it 'is a persistent connection' do
      connection = described_class.setup('chitter_test')
      expect(described_class.connection).to eq connection
    end
  end

  describe '.query' do
    it 'performs a query on the database we have set up' do
      connection = DBConnection.setup('chitter_test')
      expect(connection).to receive(:exec).with('select * from peep')
      described_class.query('select * from peep')
    end
  end

end
