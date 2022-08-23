require 'user'

RSpec.describe User do

  describe '.create' do
    it 'creates a new user' do
      user = User.create(username:'Godzilla',email:'godzilla@email.com', password: '1234')
      expect(user.username).to eq('Godzilla')
    end

    it 'creates a new user with email and password' do
      user = User.create(username:'Godzilla', email:'godzilla@email.com', password: '1234')

      expect(user.username).to eq('Godzilla')
      expect(user.email).to eq('godzilla@email.com')
      # expect(user.password).to eq('1234')
      # taken off for now, because we cannot access attr_reader 
      # from outside the class
    end
  end
end
