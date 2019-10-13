describe ConnectDatabase do

  let(:pg_class) {double :pg_class, connect: connection}
  let(:connection) {double :connection, exec: result}
  let(:result) {double :result}

  describe '#start' do

    it 'connections to a database' do
      expect(pg_class).to receive(:connect)
      ConnectDatabase.start(pg_class, 'peep')
    end

    it 'returns a connection after starting' do
      ConnectDatabase.start(pg_class, 'peep')
      expect(ConnectDatabase.connection).to eq connection
    end

  end

  describe '#query' do
    it 'sends a query to our sql database' do
      expect(connection).to receive(:exec)
      ConnectDatabase.start(pg_class, 'peep')
      ConnectDatabase.query('sql')
    end
  end

end
