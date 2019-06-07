require './lib/user.rb'

describe User do
  context 'sign up/register' do
    it 'can register a new user' do
      User.register('Name', 'Username', 'Password')
      user = User.get_user('Username')
      expect(user[0].name).to eq('Name')
    end
  end
end
