require 'user'

describe User do

  describe '.create' do

    it 'creates a User' do
      User.create(handle: 'Maker', email: 'fake_email@gmail.com', password: '1234')
      expect(User.handle(handle: 'Maker')).to have_attributes(handle: 'Maker', email: 'fake_email@gmail.com', password: '1234')
    end
    
  end

  describe '.login' do

    it 'log a user in' do
      User.create(handle: 'Maker', email: 'fake_email@gmail.com', password: '1234')
      expect(User.login(email: 'fake_email@gmail.com', password: '1234')[:logged_in]).to eq true
    end

  end

end
