describe User do

  let!(:user) do
    User.create(name: 'Edward Kerry',
                user_name: 'Ed',
                email: 'edwardkerry@gmail.com',
                password: 'password123',
                password_confirmation: 'password123')
  end

  it 'authenticates valid user name and password' do
    authenticated = User.authenticate(user.email, user.password)
    expect(authenticated).to eq user
  end

  it 'does not authenticate invalid user name and password' do
    expect(User.authenticate(user.email, 'badpass')).to eq nil
  end

  it 'saves a password recovery token on generation' do
    expect{user.generate_token}.to change{user.password_token}
  end

  it 'saves a password recovery token time when generate_token' do
    Timecop.freeze do
      user.generate_token
      expect(user.password_token_time).to eq Time.now
    end
  end

  it 'can find a user with a valid token' do
    user.generate_token
    expect(User.find_by_valid_token(user.password_token)).to eq user
  end

  it 'can\'t find a user with a token after one hour' do
    user.generate_token
    Timecop.travel(60*60+1) do
      expect(User.find_by_valid_token(user.password_token)).to eq nil
    end
  end

end
