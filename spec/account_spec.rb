require 'account'
require 'pg'

describe Account do 

  describe ".create" do
    it "creates a new account when user signs up" do 
      # test data
      account = Account.create(name: 'Test Example', username: 'T.example1', 
        email: 'test@example.com', password: 'T.example1')

        # feature test creates the same data in db = persisted data
        # persisted_data = PG.connect(dbname: 'chitter_test').query("SELECT * FROM accounts WHERE account_id = #{account.account_id};")

      expect(account).to be_a Account
      expect(account.name).to eq 'Test Example'
      expect(account.username).to eq 'T.example1'
      expect(account.email).to eq 'test@example.com'
      expect(account.password).to eq 'T.example1'
    end  
  end 
end 
