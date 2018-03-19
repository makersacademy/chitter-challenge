require 'account'

describe 'Account' do

  describe '.new_account' do
    it "should create a new account instance" do
      name = "Daniel Campos"
      username = "@ddregalo"
      email = "info@ddregalo.com"
      password = "password123"
      expect(ChitterConnection).to receive(:query).with("INSERT INTO accounts(name, username, email, password) VALUES('#{name}', '#{username}', '#{email}', '#{password}');")
      Account.new_account(name, username, email, password)
    end
  end

  describe '.load_account' do
    context 'A valid username/password is submitted' do
      it 'should send FIND request to accounts with sql' do
        username = "@ddregalo"
        password = "password123"
        expect(ChitterConnection).to receive(:query).with("SELECT name, username FROM accounts WHERE password='#{password}' AND username='#{username}';")
        Account.load_account(username, password)
      end
    end
  end
end
