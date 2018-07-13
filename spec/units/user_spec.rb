require 'user'

describe User do
  describe '.create' do
    it 'creates a new user' do
      user = create_new_user
      expect(user.id).not_to be_nil
    end

    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('p@$$w0rd')
      create_new_user
    end
  end

  describe '.find' do
    it 'returns the user corresponding to the given id' do
      user = create_new_user
      expect(User.find(user.id).name).to eq user.name
    end

    it 'returns nil if there is no ID given' do
      expect(User.find(nil)).to eq nil
    end
  end

  describe '.authenticate' do
    it 'returns a user given a correct username and password' do
      user = create_new_user
      authenticated_user = User.authenticate('test@testmail.com', 'p@$$w0rd')
      expect(authenticated_user.id).to eq user.id
    end

    it 'returns nil given an incorrect email address' do
      create_new_user
      expect(User.authenticate(
        'nottherightemail@testmail.com',
        'p@$$w0rd'
        )).to be_nil
    end

    it 'returns nil given an incorrect password' do
      create_new_user
      expect(User.authenticate(
        'test@testmail.com',
        'UUr0ng_p@$$w0rd'
        )).to be_nil
    end
  end
end
