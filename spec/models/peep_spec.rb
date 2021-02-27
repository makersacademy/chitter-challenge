describe Peep do
  before do
    User.create(name: 'test1', email: 'test1@test.com',
      username: 'testname1', password: 'Test111')
  end

  describe '.create' do
    it 'runs query to insert peep into table' do
      peep = described_class.create(content: 'Building Chitter', user_id: 1)
      query_peep = DatabaseConnection.query('SELECT * FROM peeps').first

      expect(peep.id).to eq query_peep['id']
      expect(peep.time).to eq query_peep['time']
      expect(peep.content).to eq query_peep['content']
      expect(peep.user_id).to eq query_peep['user_id']
    end

    it 'creates a peep' do
      peep = described_class.create(content: 'Building Chitter', user_id: 1)

      expect(peep.user_id).to eq '1'
      expect(peep.content).to eq 'Building Chitter'
    end
  end

  describe '.all' do
    it 'returns all the peeps' do
      described_class.create(content: 'Building Chitter', user_id: 1)
      described_class.create(content: 'Taking a break', user_id: 1)
      described_class.create(content: 'Writing tests', user_id: 1)

      peeps = described_class.all

      expect(peeps.length).to be 3
      expect(peeps.map(&:content)).to include 'Building Chitter'
      expect(peeps.map(&:content)).to include 'Writing tests'
    end
  end
end
