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

  describe '#select_user' do
    it 'creates a new .user instance if user_name argument = user_name in database' do
      expect(Users.select_user('test user name')).to be_instance_of(Users)
    end
  end
end
