require 'account'

describe Account do

  describe '#self.all' do

    it 'returns an array' do
      expect(Account.all).to be_an_instance_of(Array)
    end

    it 'array contains account instances' do
      index = rand(Account.all.length)
      expect(Account.all[index]).to be_an_instance_of(Account)
    end

    it 'accounts have the correct attributes' do
      expect(Account.all[0]).to have_attributes(username: 'Paola', password: 'Hola', email: 'paola@yahoo.com')
    end

    it 'accounts are ordered by id' do
      index = rand(Account.all.length)
      id = (index + 1).to_s
      expect(Account.all[index].id).to eq(id)
    end

  end

  describe '#self.sign_up' do

    it 'adds an account to database' do
      Account.sign_up('Hemesh','Hello','hemesh@hotmail.nz')
      expect(Account.all[-1]).to have_attributes(username: 'Hemesh', password: 'Hello', email: 'hemesh@hotmail.nz')
    end

    it 'returns invalid username if the username is taken' do
      expect(Account.sign_up('Paola','Q onda','paola2@yahoo.com')).to eq('invalid username')
    end

    it 'returns invalid email if email is taken' do
      expect(Account.sign_up('Paola_two','Buenos dias','paola@yahoo.com')).to eq('invalid email')
    end

  end

  describe '#self.login' do

    it 'changes the current user from nil to the input user' do
      Account.login('Giacomo','Bonjourno')
      expect(Account.current_user.username).to eq('Giacomo')
    end

    it 'returns false if username is not recognised' do
      expect(Account.login('Giacomo','Hola')).to eq(false)
    end

    it 'returns false if the password is incorrect' do
      expect(Account.login('Giacomo','Hola')).to eq(false)
    end

  end

  describe '#self.logout' do

    it 'changes the current user to nil' do
      Account.login('Giacomo','Bonjourno')
      expect{ Account.logout }.to change{ Account.current_user }.to(nil)
    end

  end

  describe '#self.current_user' do

    it 'returns nil if no one is logged in' do
      Account.logout
      expect(Account.current_user).to eq(nil)
    end

    it 'returns an instance of account' do
      Account.login('Paola','Hola')
      expect(Account.current_user).to be_an_instance_of(Account)
    end

    it 'returns the correct user' do
      Account.login('Paola','Hola')
      expect(Account.current_user).to have_attributes(username: 'Paola', email: 'paola@yahoo.com')
    end

  end

  # describe '#notification' do
  #
  # end

end
