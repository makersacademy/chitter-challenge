require 'account'

describe Account do
  describe '#self.all' do
    it 'lists all accounts' do
      acc = Account.all
      user = acc.map(&:name)
      expect(user).to include 'Alex'
      expect(user).to include 'Zac'
      expect(user).to include 'Basil'
    end

    it 'returns accounts in order of id' do
      index = rand(3)
      expect(Account.all[index].id).to eq((index + 1).to_s)
    end
  end

  describe '#self.setup' do
    it 'sets up a Chitter account' do
      Account.setup(name: 'Adrian')
      acc = Account.all
      user = acc.map(&:name)
      expect(user).to include 'Adrian'
    end
  end

  describe '#self.login' do

  end

  describe '#self.logout' do

  end

end
