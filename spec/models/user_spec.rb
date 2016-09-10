require './app/models/user'

describe User do

  let!(:user) do User.create(name: "John Smith",
                             username: 'chitter1',
                             email: "chitter1@testdomain.com",
                             password: "Password1",
                             password_confirmation: "Password1")
  end

  context '#authenticate' do
    it 'authenticates the user and returns the user object if authentication complete' do
      expect(User.authenticate(user.email, 'Password1')).to eq user
    end

    it 'authentication fails because of wrong password' do
      expect(User.authenticate(user.name, 'Password2')).to eq nil
    end

    it 'authentication fails because of wrong email' do
      expect(User.authenticate('chitter2@testdomain.com', 'Password1')).to eq nil
    end
  end
end
