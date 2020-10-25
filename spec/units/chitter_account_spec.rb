require_relative '../../lib/chitter_account.rb'
describe ChitterAccount do
  describe '.create' do
    it 'returns username, email and name of created account' do
      user = ChitterAccount.create(username: 'Jane007', name: 'Jane Austen', email: 'Jdoggydog@myspace.com', password: 'xxx')
      expect(user.username).to eq('Jane007')
      expect(user.name).to eq('Jane Austen')
      expect(user.email).to eq('Jdoggydog@myspace.com')
    end

    it 'raises an error if the username already exists in the database' do
      user = ChitterAccount.create(username: 'Jane007', name: 'Jane Austen', email: 'Jdoggydog@myspace.com', password: 'xxx')
      expect { ChitterAccount.create(username: 'Jane007', name: 'Jane Doe', email: 'jog-on@hotmail.com', password: 'YYY') }.to raise_error('username already in use')
    end
  end
  describe '.all' do
    it 'returns all the usernames, names and emails' do
      user = ChitterAccount.create(username: 'Jane007', name: 'Jane Austen', email: 'Jdoggydog@myspace.com', password: 'xxx')
      accounts = ChitterAccount.all
      expect(accounts.first.username).to eq('Jane007')
      expect(accounts.first.name).to eq('Jane Austen')
      expect(accounts.first.email).to eq('Jdoggydog@myspace.com')
    end
  end
end