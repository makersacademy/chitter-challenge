require 'user'

describe User do

  describe 'creation of a user' do

    subject(:bill) { described_class.create(name: 'bill', email: 'no1@home.com',
                            username: 'bm', password: 'password')
    }

    it 'has a name' do
      expect(bill.name).to eq('bill')
    end

    it 'has an email address' do
      expect(bill.email).to eq 'no1@home.com'
    end

    it 'has a username' do
      expect(bill.username).to eq 'bm'
    end

    it 'has a password' do
      expect(bill.password).to eq 'password'
    end

  end

end
