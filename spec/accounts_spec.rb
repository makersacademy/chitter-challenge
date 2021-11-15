require 'account'

describe Account do

  describe '.create' do 
    it 'creates a new account instance' do
      new_account = Account.create(username: "ChitterBox", email: "example@email.com", password: "Password1")
      expect(new_account.username).to eq("ChitterBox")
    end
  end
end