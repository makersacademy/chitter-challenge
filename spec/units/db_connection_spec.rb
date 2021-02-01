describe DBConnection do

  let(:connection) { described_class.setup('chitter_test') }

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
      expect(connection).to receive(:exec).with('select * from peep')
      described_class.query('select * from peep')
    end
  end

  describe '.insert' do
    it 'executes a prepared insert query' do
      table, values, columns = 'peep', ['Test Data'], ['content']
      expect(connection).to receive(:exec_prepared).with('insert_statement', values)
      described_class.insert(table: table, columns: columns, values: values)
    end
  end

end
