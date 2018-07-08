require 'user'

describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create('The Testman', 'Testee McTest', 'test@testmail.com', 'p@$$w0rd')
      expect(user.id).not_to be_nil
    end

    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('p@$$w0rd')
      User.create('The Testman', 'Testee McTest', 'test@testmail.com', 'p@$$w0rd')
    end
  end

  describe '.find' do
    it 'returns the user corresponding to the given id' do
      user = User.create('The Testman', 'Testee McTest', 'test@testmail.com', 'p@$$w0rd')
      expect(User.find(user.id).name).to eq user.name
    end

    it 'returns nil if there is no ID given' do
      expect(User.find(nil)).to eq nil
    end
  end

  describe '.authenticate' do
    it 'returns a user given a correct username and password' do
      user = User.create('The Testman', 'Testee McTest', 'test@testmail.com', 'p@$$w0rd')
      authenticated_user = User.authenticate('test@testmail.com', 'p@$$w0rd')
      expect(authenticated_user.id).to eq user.id
    end

    it 'returns nil given an incorrect email address' do
      User.create('The Testman', 'Testee McTest', 'test@testmail.com', 'p@$$w0rd')
      expect(User.authenticate('nottherightemail@testmail.com', 'p@$$w0rd')).to be_nil
    end

    it 'returns nil given an incorrect password' do
      User.create('The Testman', 'Testee McTest', 'test@testmail.com', 'p@$$w0rd')
      expect(User.authenticate('test@testmail.com', 'UUr0ng_p@$$w0rd')).to be_nil
    end
  end
end
