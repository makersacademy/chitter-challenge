describe User do
  subject(:user) do User.create(name: 'David',
                                        username: 'david123',
                                        email:'david@hotmail.com',
                                        password:'qwerty123',
                                        password_confirmation:'qwerty123'
                          )
  end

  describe '#authenticate' do
    it 'returns the user if successfully authenticated using username as login' do
      expect(User.authenticate(user.username,'qwerty123')).to eq user
    end

    it 'returns the user if successfully authenticated using email as login' do
      expect(User.authenticate(user.email,'qwerty123')).to eq user
    end

    it 'returns the nil if wrong password' do
      expect(User.authenticate(user.email,'wrongpasswrd')).to eq nil
    end
  end

end
