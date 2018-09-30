describe Peep do

  before(:each) { @connection = PG.connect dbname: 'chitter_test' }
  before(:each) { @user = User.create(name: 'Test Name', username: 'Test', email: 'test@example.com', password: 'password123') }

  describe '.add' do
    it 'adds a peep to the database' do
      peep = Peep.add('Test 1', @user.id, @user.username)
      expect(peep).to be_a Peep
      expect(peep).to respond_to(:id)
      expect(peep).to respond_to(:user_id)
      expect(peep.text).to eq 'Test 1'
    end
  end

  describe '.all' do
    it 'returns all peeps stored in the database' do
      Peep.add('Test 1', @user.id, @user.username)
      Peep.add('Test 2', @user.id, @user.username)
      Peep.add('Most Recent Test', @user.id, @user.username)

      peeps = Peep.all
      expect(peeps.length).to eq 3

      peep = Peep.all.first
      expect(peep).to be_a Peep
      expect(peep).to respond_to(:id)
      expect(peep).to respond_to(:user_id)
      expect(peep).to respond_to(:time)
      expect(peep.text).to eq 'Most Recent Test'
    end
  end
end
