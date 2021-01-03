describe DatabaseConnection do
  describe ".setup" do
    it 'should respond with 1 argument' do
      expect(described_class).to respond_to(:setup).with(1).argument
    end

    it 'should establish a connection with a given database' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_test')
      described_class.setup('chitter_test')
    end
  end

  describe ".query" do
    it 'should respond with 1 argument' do
      expect(described_class).to respond_to(:query).with(1).argument
    end

    it 'should execute the query string' do
      connection = described_class.setup('chitter_test')
      expect(connection).to receive(:exec).with('SELECT * FROM peeps')

      described_class.query('SELECT * FROM peeps')
    end
  end
end
