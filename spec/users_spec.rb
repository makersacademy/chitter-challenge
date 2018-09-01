require 'users'

describe Users do

  before(:each) do
    Users.create("test name", "test user name", "test@email.com", "testpassword")
  end

  describe '#create' do
    it 'creates a user' do
      expect(Users).to respond_to(:create).with(4).arguments
    end
  end

  describe '#unique_input_checker' do
    it 'returns true if an email argument matches an email in database' do
      expect(Users.unique_input_checker("test@email.com", :email)).to eq true
    end

    it 'returns true if an user name argument matches a user name in database' do
      expect(Users.unique_input_checker("test user name", :user_name)).to eq true
    end
  end

  describe '#log_in_checker' do
    it 'returns true if log in elements match database elements for user' do
      expect(Users.log_in_checker('test user name', 'testpassword')).to eq true
    end

    it 'returns false if log in elements do not match database elements for user' do
      expect(Users.log_in_checker('incorrect user name', 'incorrect password')).to eq false
    end
  end

  describe '#select_user' do
    it 'creates a new .user instance if user_name argument = user_name in database' do
      expect(Users.select_user('test user name')).to be_instance_of(Users)
    end
  end
end
