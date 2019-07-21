require './models/accounts'
require 'database_helper'

describe Accounts do


  describe '.create' do
    it 'hashes the password using BCrypt' do
       expect(BCrypt::Password).to receive(:create).with('12345')

       Accounts.create(username: 'Leo', email: 'haha@gmail.com', password: '12345')
    end
  end

  describe '.create' do
    it 'creates a new user' do
      accounts = Accounts.create(username: 'Leo', email: 'haha@gmail.com', password: '12345')
      persisted_data = persisted_data(id: accounts.id, table: 'accounts')

      expect(accounts).to be_a Accounts
      expect(accounts.id).to eq persisted_data['id']
      expect(accounts.username).to eq 'Leo'
      expect(accounts.email).to eq 'haha@gmail.com'
      # expect(accounts.password).to eq '12345'
    end
  end

end
