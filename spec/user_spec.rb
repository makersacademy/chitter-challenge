require 'user'

describe User do
  describe 'self.new_user' do
    it 'creates a new user on the database and a instance of User' do
      user = User.new_user('littletrout', 'password1', 'littletrout@notadomain.com')

      stored_data = stored_user(table: 'users', user_id: user.user_id)
      
      expect(user).to be_a(User)
      expect(user.user_id).to eq(stored_data.first['user_id'])
      expect(user.username).to eq(stored_data.first['username'])
      expect(user.email).to eq(stored_data.first['email'])
    end
  end

  describe 'Contains the data for a user' do
    it "has an id, username, and email address" do
      user = User.new(user_id: '1', username: 'snowy', email: 'snowy@gmail.com')
      expect(user).to respond_to(:username)
      expect(user).to respond_to(:user_id)
      expect(user).to respond_to(:email)
    end
  end
end
