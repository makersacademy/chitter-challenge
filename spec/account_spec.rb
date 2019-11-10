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
end
