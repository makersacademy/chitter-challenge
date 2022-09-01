require 'user'

describe User do
  describe '.sign_up' do
    it 'takes the details of a new user' do
      user = User.sign_up(name: 'Harry', email: 'potterules@hp.com', password: 'deathtovoldy')
      expect(user.name).to eq 'Harry'
    end
  end
end