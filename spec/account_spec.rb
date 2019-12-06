require 'account'

describe Account do

  describe '#create' do
    it 'should create a new account' do
      account = Account.create('dbacall', 'dbacall@hotmail.co.uk', 'password')

      expect(account.username).to eq 'dbacall'
      
    end
  end

  describe '#new_account' do
    it 'should return the new account as an instance of account' do
      Account.create('dbacall', 'dbacall@hotmail.co.uk', 'password')
      account = Account.new_account
      p account
      expect(account.username).to eq 'dbacall'
    end
  end

end