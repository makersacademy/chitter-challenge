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
  #
  # describe '.query' do
  #
  # end

end
