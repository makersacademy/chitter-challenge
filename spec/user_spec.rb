require 'user'

describe User do
  describe '.find' do
    it 'finds a user by ID' do
      user = User.create(email: 'example@lycos.com', password: 'fakepassword')
      result = User.find(user.id)

      expect(result.id).to eq user.id
      expect(result.email).to eq user.email
    end

    it 'returns nil if there is no id given' do
      expect(User.find(nil)).to eq nil

    end
  end

  describe '.create' do
    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('fakepassword')

      User.create(email: 'example@lycos.com', password: 'fakepassword')
    end
  end

end
