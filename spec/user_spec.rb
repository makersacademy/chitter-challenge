describe User do

Timecop.freeze(Time.now)

  context 'When signing up' do

    it 'can set an encrypted password' do
      user = build(:user)
      sign_up(user)
      expect(BCrypt::Password.new(user.password_digest)).to eq 'password'
    end

  end

  context 'when resetting password' do

    it 'a password token is timestamped' do
      user = build(:user)
      sign_up(user)
      user.password_token
      expect(user.password_token_timestamp).to eq Time.now
    end


  end



end