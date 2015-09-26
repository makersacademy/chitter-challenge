describe User do

  context 'When signing up' do

    it 'can set a password' do
      user = build(:user)
      sign_up(user)
      expect(BCrypt::Password.new(user.password_digest)).to eq 'password'
    end

  end

end