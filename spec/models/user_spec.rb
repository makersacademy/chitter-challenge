describe User do

  let(:user) do
    User.create(name: 'Chris', username: 'Wynndow',
                email: 'chris.wynndow@gmail.com', password: 'password',
                password_confirmation: 'password')
  end

  describe '#authenticate' do

    it 'returns the user if credentials are correct' do
      expect(user.authenticate(user.email, user.password)).to eq user
    end

    it 'returns nil if credentials are incorrect' do
      expect(user.authenticate(user.email, 'wrong')).to eq nil
    end

  end

end
