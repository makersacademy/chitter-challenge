describe Peep do
  before do
    DatabaseConnection.query(
      "INSERT INTO users (name, username, email, password)
      VALUES ('test', 'test', 'test@test.com', 'test123');"
    )
  end

  describe '.create' do
    it 'runs a query to insert peep into table' do
      peep = described_class.create(content: 'Building Chitter', user_id: 1)
      db_peep = DatabaseConnection.query('SELECT * FROM peeps').first

      expect(peep.id).to eq db_peep['id']
      expect(peep.time).to eq db_peep['time']
      expect(peep.content).to eq db_peep['content']
      expect(peep.user_id).to eq db_peep['user_id']
    end

    it 'returns the data within a peep' do
      peep = described_class.create(content: 'Building Chitter', user_id: 1)

      expect(peep.user_id).to eq '1'
      expect(peep.content).to eq 'Building Chitter'
    end
  end
end
