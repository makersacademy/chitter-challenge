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
end
