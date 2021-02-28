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

  describe '.delete' do
    it 'deletes the peep from the database' do
      peep = described_class.create(content: 'Building Chitter', user_id: 1)
      expect(Peep.all).not_to be_empty

      described_class.delete(id: peep.id)
      expect(Peep.all).to be_empty
    end

    it 'only deletes the correct peep' do
      described_class.create(content: 'Building Chitter', user_id: 1)
      described_class.create(content: 'Taking a break', user_id: 1)
      described_class.create(content: 'Writing tests', user_id: 1)

      expect(Peep.all.length).to be 3

      described_class.delete(id: 2)

      expect(Peep.all.length).to be 2
      expect(Peep.all.map(&:content)).to include 'Building Chitter'
      expect(Peep.all.map(&:content)).to include 'Writing tests'
    end
  end

  describe '.find' do
    it 'returns the peep by its id' do
      peep = described_class.create(content: 'Building Chitter', user_id: 1)
      found_peep = described_class.find(id: peep.id)

      expect(peep.id).to eq found_peep.id
      expect(peep.content).to eq found_peep.content
      expect(peep.user_id).to eq found_peep.user_id
    end
  end

  describe '.update' do
    it 'updates the content of the peep' do
      peep = described_class.create(content: 'Building Chitter', user_id: 1)
      content = 'This many to many relationship stuff is hard work'
      expect(described_class.find(id: peep.id).content).not_to eq content

      described_class.update(id: peep.id, content: content)
      expect(described_class.find(id: peep.id).content).to eq content
    end
  end

  describe '#username' do
    it 'returns username of the peeper' do
      peep = described_class.create(content: 'Building Chitter', user_id: 1)
      expect(peep.username).to eq 'testname1'
      expect(peep.user_id).to eq '1'
    end

    it 'works with multiple users in the database' do
      User.create(name: 'test2', email: 'test2@test.com', username: 'testname2', password: 'Test222')
      User.create(name: 'test3', email: 'test3@test.com', username: 'testname3', password: 'Test333')

      peep1 = described_class.create(content: 'Building Chitter', user_id: 1)
      peep2 = described_class.create(content: 'Taking a break', user_id: 2)
      peep3 = described_class.create(content: 'Writing tests', user_id: 3)

      expect(peep1.username).to eq 'testname1'
      expect(peep2.username).to eq 'testname2'
      expect(peep3.username).to eq 'testname3'
    end
  end

  describe '#name' do
    it 'returns name of the peeper' do
      peep = described_class.create(content: 'Building Chitter', user_id: 1)
      expect(peep.name).to eq 'test1'
      expect(peep.user_id).to eq '1'
    end

    it 'works with multiple users in the database' do
      User.create(name: 'test2', email: 'test2@test.com', username: 'testname2', password: 'Test222')
      User.create(name: 'test3', email: 'test3@test.com', username: 'testname3', password: 'Test333')

      peep1 = described_class.create(content: 'Building Chitter', user_id: 1)
      peep2 = described_class.create(content: 'Taking a break', user_id: 2)
      peep3 = described_class.create(content: 'Writing tests', user_id: 3)

      expect(peep1.name).to eq 'test1'
      expect(peep2.name).to eq 'test2'
      expect(peep3.name).to eq 'test3'
    end
  end
end
