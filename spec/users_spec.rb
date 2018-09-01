require 'users'

describe Users do

  describe '#create' do
    it 'creates a user' do
      expect(Users).to respond_to(:create).with(4).arguments
    end
  end

  describe '#unique_input_checker' do
    it 'returns true if an email argument matches an email in database' do
      Users.create("test name", "test user name", "test@email.com", "testpassword")
      expect(Users.unique_input_checker("test@email.com", :email)).to eq true
    end

    it 'returns true if an user name argument matches a user name in database' do
      Users.create("test name", "test user name", "test@email.com", "testpassword")
      expect(Users.unique_input_checker("test user name", :user_name)).to eq true
    end
  end

end
