require 'account'

describe Account do
  context "#create_account" do
    it "adds new row to database" do
      account = Account.create_account(email: 'eddy@gmail.com', password: '1234', name: 'Eddy')
      account_creation_verifier = account_creation_verifier(id:account.id)

      expect(account.id).to eq account_creation_verifier['id']
      expect(account.email).to eq account_creation_verifier['email']
      expect(account.password).to eq account_creation_verifier['password']
      expect(account.name).to eq account_creation_verifier['name']
    end
  end

  context '#account_identifier' do
    it 'selects correct account when user logs in' do
      Account.create_account(email: 'eddy@gmail.com', password: '1234', name: 'Eddy')
      id_check = Account.create_account(email: 'ailsarenton@gmail.com', password: 'eddy', name: 'Ailsa')
      Account.create_account(email: 'harry@live.com', password: 'password1234', name: 'Harry')
      account = Account.account_identifier(email:'ailsarenton@gmail.com', password:'eddy')
      expect(account.id).to eq id_check.id

    end
  end
end
