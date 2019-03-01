require './lib/user.rb'

describe 'user' do
  describe 'when creating new user' do
    let(:user) { { username: 'simon', password: 'unbreakable' } }
    before(:each) { User.create(user) }
    
    it 'should save the username' do
      expect(User.all[0].username).to eq(user[:username])
    end

    it 'should save the password as a hash' do
      expect(User.all[0].password.length).to be > user[:password].length
    end
  end
end