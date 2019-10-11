require 'account'
require 'pg'

describe Account do
  describe '.create' do
    it 'creates a new account' do
      account = Account.create(email: 'test@email.com', password: 'test')
      expect(account).to be_a Account
      expect(account.email).to eq 'test@email.com'
      expect(account.password).to eq 'test'
    end
  end
end
