require 'spec_helper'

describe User do
  let(:user) { User.create(name: 'Laszlo', user_name: 'laszlobogacsi', email: 'bogacsi.laszlo@gmail.com', password: 'password', password_confirmation: 'password') }

  it 'authenticates the user by email address' do
      auth_user = User.authenticate(user.user_name, user.password)
      expect(auth_user).to eq user
  end

  it 'does not authenticate when incorrect password is given' do
      auth_user = User.authenticate(user.user_name, 'wrongpassword')
      expect(auth_user).to eq nil
  end

end
