require './lib/user'
require './config/data_mapper'

describe User do
  let(:user) { User.create(name: 'Socks', username: 'socks101', email: 'socks@socks.com', password: 'Socks123') }
  it 'knows its name' do
    expect(user.name).to eq 'Socks'
  end

  context 'Sign up:' do
    it 'signs up successfully' do
      expect(User.create(name: 'Socks', username: 'socks101', email: 'socks@socks.com', password: 'Socks123')).to be_truthy
    end
  end

  context 'Authentication' do
    let!(:david) { User.create(name: 'Socks', username: 'socks101', email: 'socks@socks.com', password: 'Socks123') }
    it 'returns nil if password incorrect' do
      expect(User.authenticate(david.username, 'Password')).to eq nil
    end

    it 'returns nil if user has not signed up' do
      expect(User.authenticate('test', david.password)).to eq nil
    end
  end

  context 'email used twice' do
    let!(:david) { User.create(name: 'Socks', username: 'socks101', email: 'socks@socks.com', password: 'Socks123') }
    let!(:mittens) { User.create(name: 'Mittens', username: 'mittens100', email: 'socks@socks.com', password: 'Secret') }
    it 'not valid if same username' do
      expect(mittens.valid?).to eq false
    end
  end

end
