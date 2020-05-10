require 'spec_helper'
require 'database_helpers'
require 'user'

describe User do

  describe '.create' do
    it 'creates a new user' do
      user = User.create( name: 'Jo', email: 'testing@test.com', password: 'password')
  
      expect(user).to be_a User
      expect(user.name).to eq 'Jo'
      expect(user.email).to eq 'testing@test.com'
      expect(user.password).to eq 'password'
    end
  end
end