require 'user'

describe User do
  decribe '.create' do
    it 'creates a new user' do
      user = User.create(email: 'clare.pinder@live.co.uk', password: 'password123')

      expect(user).to be_a User
      expect(user.email).to eq 'clare.pinder@live.co.uk'
    end
  end
end
