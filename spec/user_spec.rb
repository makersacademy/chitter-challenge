require 'user'

describe User do
  let(:peep) { double(:peep, user_id: '1') }
  let(:albob) { User.new(
    id: '1', email: 'albob123@gmail.com', password: 'password123',
    name: 'Alice Bobson', username: 'albob123'
    )
  }

  before do
    add_users_to_test_database
  end

  describe '.all' do
    it 'should return users' do
      user = described_class.all.first
      expect(user).to be_a User
      expect(user.id).to eq '1'
      expect(user.email).to eq albob.email
      expect(user.password).to eq BCrypt::Password.new(user.password)
      expect(user.name).to eq albob.name
      expect(user.username).to eq albob.username
    end
  end

  describe '.create' do
    it 'should be able to insert a user into the database' do
      result = described_class.create(
        email: 'test@gmail.com', password: 'testpassword',
        name: 'Test User', username: 'usertest'
      ).first
      expect(result['id']).to eq '3'
      expect(result['email']).to eq 'test@gmail.com'
      expect(result['password']).to eq BCrypt::Password.new(result['password'])
      expect(result['name']).to eq 'Test User'
      expect(result['username']).to eq 'usertest'
    end

    it 'should return nil if any fields are empty' do
      expect(described_class.create(email: albob.email,
        password: albob.password, name: "", username: "")).to eq nil
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
      user = described_class.authenticate(albob.email, albob.password)
      expect(user.email).to eq albob.email
      expect(user.name).to eq albob.name
      expect(user.password).to eq BCrypt::Password.new(user.password)
      expect(user.id).to eq albob.id
      expect(user.username).to eq albob.username
    end

    it 'should not return user info for an incorrect email' do
      email, password = '123albob@gmail.com', 'password123'
      expect(described_class.authenticate(email, password)).to eq nil
    end

    it 'should not return user info for an incorrect password' do
      email, password = 'albob123@gmail.com', '123password'
      expect(described_class.authenticate(email, password)).to eq nil
    end
  end
end
