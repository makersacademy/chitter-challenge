require 'users'
describe User do

  context 'I want to sign up for Chitter' do

    it 'inits user' do
      user = User.new(id: 1, username: 'username', email: 'username@gmail.com')
      expect(user.id).to eq 1
      expect(user.username).to eq 'username'
      expect(user.email).to eq 'username@gmail.com'
    end

  end

end