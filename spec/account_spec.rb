require_relative '../public/lib/account'

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
      expect(account.username).to eq 'dbacall'
    end
  end

  describe '#log_in' do
    it 'should return true if log in succesful' do
      Account.create('dbacall', 'dbacall@hotmail.co.uk', 'password')
      expect(Account.log_in('dbacall', 'password')).to eq true
    end
  end
end
