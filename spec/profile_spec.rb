require 'profile'

describe Profile do

  describe '.all' do
    it 'retrieves the usernames from the database' do
      profiles = Profile.all
      expect(profiles).to include('chocolatine')
    end
  end

  describe '.create' do
    it 'creates a new user' do
      Profile.create(username: 'chocolatine', name: 'mathilde', email: 'mathilde@email.com', password: '1234')
    end
  end

end
