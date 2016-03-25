describe User do

  let!(:user) do
    User.create(username: 'alice',
                email: 'alice@gmail.com',
                password: '12345',
                password_confirmation: '12345')
  end

  describe '#authenticate' do
    it 'returns a user if email and password given are correct' do
      expect(User.authenticate('alice@gmail.com', '12345')).to eq(user)
    end

    it 'does not authenticate when given an incorrect password' do
      expect(User.authenticate('alice@gmail.com', 'wrong_pw')).to be_nil
    end

    it 'does not authenticate when given and invalid email' do
      expect(User.authenticate('invalid@gmail.com', '12345')).to be_nil
    end
  end
end
