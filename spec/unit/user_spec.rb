require 'user'

describe User do

  describe '.create' do

    it 'creates a User' do
      User.create(handle: 'Maker', email: 'fake_email@gmail.com', password: '1234')
      expect(User.login(email:'fake_email@gmail.com' , password: '1234')).to include(handle: 'Maker', email: 'fake_email@gmail.com', password: '1234', logged_in: true)
    end
    
  end

  describe '.login' do

    it 'log a user in' do
      User.create(handle: 'Maker', email: 'fake_email@gmail.com', password: '1234')
      expect(User.login(email: 'fake_email@gmail.com', password: '1234')[:logged_in]).to eq true
    end

  end

end
