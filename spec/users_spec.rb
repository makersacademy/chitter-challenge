require 'model_router'

describe User do
  let(:user_details) {[
    { :email => 'bob@testing.com', :user_name => 'bob', :password => 'password' },
    { :email => 'fred@testing.com', :user_name => 'fred', :password => 'password' }
  ]}

  context '#all' do
    it 'Stores users' do
      add_test_users_directly(user_details)
      expect(User.all.count).to eq user_details.length
    end
    it 'Stores email addresses' do
      add_test_users_directly(user_details)
      expect(User.all[0].email).to eq user_details[0][:email]
    end
    it 'Stores the user_name' do
      add_test_users_directly(user_details)
      expect(User.all[0].user_name).to eq user_details[0][:user_name]
    end
    it 'Stores the password' do
      add_test_users_directly(user_details)
      expect(User.all[0].password).to eq user_details[0][:password]
    end
  end

  context '#create' do
    it 'Can add users' do
      add_test_users(user_details)
      expect(User.all).to eq @test_users
    end
  end
end
