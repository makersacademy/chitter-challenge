require 'user'

describe User do
  let(:peep) { double(:peep, user_id: '1') }

  before do
    add_users_to_test_database
  end

  describe '.all' do
    it 'should return users' do
      user = described_class.all.first
      expect(user).to be_a User
      expect(user.id).to eq '1'
      expect(user.email).to eq 'albob123@gmail.com'
      expect(user.password).to eq 'password123'
      expect(user.name).to eq 'Alice Bobson'
      expect(user.username).to eq 'albob123'
    end
  end

  describe '.create' do
    it 'should be able to insert a user into the database' do
      result = described_class.create(
        'test@gmail.com', 'testpassword', 'Test User', 'usertest'
      ).first
      expect(result['id']).to eq '3'
      expect(result['email']).to eq 'test@gmail.com'
      expect(result['password']).to eq 'testpassword'
      expect(result['name']).to eq 'Test User'
      expect(result['username']).to eq 'usertest'
    end
  end

  describe '.find' do
    it "should return the correct user given a peep's user id" do
      user = described_class.all.first
      result = described_class.find(peep.user_id)
      expect(result.id).to eq user.id
    end
  end

  describe '.authenticate' do
    it 'should return the correct user info' do
      email, password = 'albob123@gmail.com', 'password123'
      user = described_class.authenticate(email, password)
      expect(user.email).to eq email
      expect(user.password).to eq password
      expect(user.name).to eq 'Alice Bobson'
      expect(user.id).to eq '1'
      expect(user.username).to eq 'albob123'
    end
  end
end
