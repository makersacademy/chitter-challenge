require 'user'

describe User do
  describe '.create' do
    it 'creates a user' do
      user = User.create(name: "Gareth", email: "gareth@gmail.com", password: '12345')

      expect(user.name).to eq "Gareth"
    end
  end

  describe '.authenticate' do
    before(:each) { User.create(name: "Gareth", email: "gareth@gmail.com", password: '12345') }

    it 'returns user if email and password is correct' do
      user = User.authenticate(email: "gareth@gmail.com", password: '12345')

      expect(user).to be_a(User)
    end

    it 'returns false if email and password is incorrect' do
      user = User.authenticate(email: "gareth@gmail.com", password: 'nope')

      expect(user).to eq false
    end
  end
end
