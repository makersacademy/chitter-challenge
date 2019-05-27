require 'user'
require 'database_helpers'

describe User do
  let(:user_signup) do
    User.sign_up(email: 'test@test.com',
                 password: 'password123',
                 name: 'test user',
                 username: 'test_user')
  end

  describe '#sign_up' do
    it 'should add a user to the database' do
      persisted_data = persisted_data_users(id: user_signup.id)

      expect(user_signup).to be_an_instance_of(User)
      expect(user_signup.id).to eq(persisted_data.first['id'])
      expect(user_signup.email).to eq('test@test.com')
      expect(user_signup.name).to eq('test user')
      expect(user_signup.username).to eq('test_user')
    end
  end

  describe '#unique_email?' do
    before(:each) do
      user_signup
    end

    it 'should return true if email is unique' do
      expect(User.unique_email?('unique@unique.com')).to eq(true)
    end

    it 'should return false if email is not unique' do
      expect(User.unique_email?('test@test.com')).to eq(false)
    end
  end

  describe '#unique_username?' do
    before(:each) do
      user_signup
    end

    it 'should return true if username is unique' do
      expect(User.unique_username?('unique_user')).to eq(true)
    end

    it 'should return false if username is not unique' do
      expect(User.unique_username?('test_user')).to eq(false)
    end
  end
end
