require_relative '../../lib/chitter_account.rb'
describe ChitterAccount do
  describe '.create' do
    it 'returns username of created account' do
      user = ChitterAccount.create(username: 'Jane007', name: 'Jane Austen', email: 'Jdoggydog@myspace.com', password: 'xxx')
      expect(user.username).to eq('Jane007')
    end
  end
  describe '.all' do
    it 'returns all the usernames' do
      user = ChitterAccount.create(username: 'Jane007', name: 'Jane Austen', email: 'Jdoggydog@myspace.com', password: 'xxx')
      accounts = ChitterAccount.all
      expect(accounts.first).to eq('Jane007')
    end
  end
end