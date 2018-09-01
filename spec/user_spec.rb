# user_spec.rb

describe User do
  describe '.signup' do
    it 'returns a User object' do
      info = {"name"=>"Dave", "email"=>"dave@dave.com", "password"=>"pw123", "username"=>"dave123"}
      user = User.signup(info)
      expect(user).to be_a User
      expect(user.username).to eq 'dave123'
    end

    it 'returns message if email address is already in database' do
      info = {"name"=>"Dave", "email"=>"dave@dave.com", "password"=>"pw123", "username"=>"dave123"}
      User.signup(info)
      user2 = User.signup(info)
      expect(user2).to eq :non_unique_email
    end

    it 'returns message if username is already in database' do
      info = {"name"=>"Dave", "email"=>"dave@dave.com", "password"=>"pw123", "username"=>"dave123"}
      User.signup(info)
      info = {"name"=>"Dave", "email"=>"dave2@dave.com", "password"=>"pw123", "username"=>"dave123"}
      user2 = User.signup(info)
      expect(user2).to eq :non_unique_username
    end
  end

  describe '.current_user' do
    it 'returns the current user\'s username' do
      info = {"name"=>"Dave", "email"=>"dave@dave.com", "password"=>"pw123", "username"=>"dave123"}
      User.signup(info)
      expect(User.current_user).to be_a User
      expect(User.current_user.username).to eq 'dave123'
      expect(User.current_user.id).not_to be nil
    end
  end

  describe '.login' do
    context 'given a user has already signed up' do
      it 'returns a User object containing the username' do
        signup_info = {"name"=>"Dave", "email"=>"dave@dave.com", "password"=>"pw123", "username"=>"dave123"}
        user = User.signup(signup_info)
        login_info = {"email"=>"dave@dave.com", "password"=>"pw123"}
        login_user = User.login(login_info)
        expect(login_user.username).to eq user.username
      end
    end

    context 'given invalid/non-existent login details' do
      it 'nil is returned' do
        login_info = {"email"=>"dave@dave.com", "password"=>"pw123"}
        expect(User.login(login_info)).to eq nil
      end
    end
  end
end
