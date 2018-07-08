require 'user'

describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create('The Testman', 'Testee McTest', 'test@testmail.com', 'p@$$w0rd')
      expect(user.id).not_to be_nil
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
end
