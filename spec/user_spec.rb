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

    it 'encrpyts the password with bcrypt' do
      expect(BCrypt::Password).to receive(:create).with('password1')

      User.new_user('littletrout', 'password1', 'littletrout@notadomain.com')
    end
  end

  describe 'self.find' do
    it 'finds a users details by user_id' do
      user = User.new_user('lettucebomb', 'password1', 'lettucebomb@notadomain.com')
      found = User.find(user.user_id)

      expect(found.user_id).to eq user.user_id
      expect(found.username).to eq user.username
      expect(found.email).to eq user.email
    end

    it 'returns nil if there is no user_id provided' do
      expect(User.find(nil)).to eq(nil)
    end
  end

  describe 'self.sign_in' do
    it "allows the user to authenticate and enter the session" do
      user = User.new_user('lettucebomb', 'password1', 'lettucebomb@notadomain.com')
      signed_in_user = User.sign_in(username: 'lettucebomb', password: 'password1')

      expect(signed_in_user.user_id).to eq(user.user_id)
    end

    it "returns nil if the user has failed to enter the correct username" do
      User.new_user('lettucebomb', 'password1', 'lettucebomb@notadomain.com')

      expect(User.sign_in(username: 'lettucebomn', password: 'password1')).to be_nil
    end

    it "returns nil if the user fails to enter the correct password" do
      User.new_user('lettucebomb', 'password1', 'lettucebomb@notadomain.com')

      expect(User.sign_in(username: 'lettucebomb', password: 'password2')).to be_nil
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
