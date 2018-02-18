require 'user'

describe User do

  describe '::create' do
    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('password2')
      User.create(email: 'telgi@gmail.com', password: 'password2')
    end
  end

  describe '::all' do
    it 'returns all users, wrapped in a User instance' do
      user = User.create(email: 'telgi@gmail.com', password: 'password2')
      expect(User.all.map(&:id)).to include user.id
    end
  end

  describe '::find' do
    it 'finds a user by their ID' do
      user = User.create(email: 'telgi@gmail.com', password: 'password2')
      expect(User.find(user.id).email).to eq user.email
    end

    it 'returns nil if there is no ID given' do
      expect(User.find(nil)).to eq nil
    end
  end

  describe '::authenticate' do
    it 'returns a user when email and password is correct' do
      user = User.create(email: 'telgi@gmail.com', password: 'password2')
      authenticated_user = User.authenticate('telgi@gmail.com', 'password2')
      expect(authenticated_user.id).to eq user.id
    end

    it 'returns nil given an incorrect email address' do
      user = User.create(email: 'telgi@gmail.com', password: 'password2')
      expect(User.authenticate('tel@gmail.com', 'password2')).to be_nil
    end
  end

end
