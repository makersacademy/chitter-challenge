require './lib/user'
require './config/data_mapper'

describe User do
  context 'Sign up:' do
    it 'can signs up' do
      expect(User.create(username: 'socks101', email: 'socks@socks.com', password: 'Socks123')).to be_truthy
    end
  end

end
