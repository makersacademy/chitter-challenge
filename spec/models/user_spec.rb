describe User do
  let!(:user) do
    User.create(username: 'bobby', email: 'bob@bobby.com', name: 'Bobby Thorn', password: '12345', password_confirmation: '12345')
  end

  it 'authenticates user when given valid username and password' do
    authenticated_user = User.authenticate(user.username, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate user when given wrong password' do
    authenticated_user = User.authenticate(user.username, 'wrong password')
    expect(authenticated_user).to eq nil
  end

  it 'saves a password recovery token when generating a token' do
    expect { user.generate_token }.to change { user.password_token }
  end

  it 'saves a password recovery token time when we generate a token using' do
    Timecop.freeze do
      user.generate_token
      expect(user.password_token_time).to eq Time.now
    end
  end

  it 'can find a user with a valid token' do
    user.generate_token
    expect(User.find_by_valid_token(user.password_token)).to eq user
  end

  it 'cannot find a user with a token after an hour' do
    user.generate_token
    Timecop.travel(60 * 60 + 1) do
      expect(User.find_by_valid_token(user.password_token)).to eq nil
    end
  end
end
