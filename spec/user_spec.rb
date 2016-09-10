require './app/models/user'

describe User do

  let!(:user) do
    User.create(name: 'abigail',
                email: 'abi@test.com',
                username: 'abimcp',
                password: 'password123',
                password_confirmation: 'password123')
  end

  describe '#authenticate' do
    it 'returns the user if password provided matches hash in db' do
      expect(User.authenticate(user.email, user.password)).to eq user
    end

    it 'returns nil if password provided does not match hash in db' do
      expect(User.authenticate(user.email, 'password456')).to eq nil
    end
  end

end
