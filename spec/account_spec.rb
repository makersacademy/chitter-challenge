require 'account'
require 'pg'
describe Account do
  
  let(:name) {"Henry Ford"}
  let(:email) {"hford@gmail.com"}
  let(:accounts) {Account.all}
  let(:subject) {Account.new("1", name, email)}
  
  describe 'Account' do
    it 'is a class' do
      expect(subject).to be_an_instance_of(Account)
    end

    it 'has an id' do
      expect(subject).to respond_to(:id)
    end

    it 'has a name' do
      expect(subject).to respond_to(:name)
    end

    it 'has an email' do
      expect(subject).to respond_to(:email)
    end
  end

  describe '.all' do
    it 'returns all accounts' do
      DatabaseConnection.query("INSERT INTO accounts (name, email) VALUES ('#{name}', '#{email}');")
      expect(accounts.first.name).to eq(name)
    end
  end

      
  describe '.sign_up(name, email)' do
    it 'adds an account to the database' do
      Account.sign_up(name, email)
      expect(accounts.first.email).to eq(email)
    end
  end

end 