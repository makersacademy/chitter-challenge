describe User do
  let!(:user) { User.create( name: 'New User',
                      username: 'whoami',
                      email: 'user@email.com',
                      password: 'password',
                      password_confirmation: 'password')
              }

  it 'authenticates with the correct password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq User.first(email: user.email)
  end

  it 'does not authenticate when given an incorrect password' do
    expect(User.authenticate(user.email, 'wrongpassword')).to be_nil
  end

  it "saves a password recovery token when we generate a token" do
    expect{ user.generate_token }.to change{ user.password_token }
  end

  it "saves a password recovery token time when we generate a token using" do
    Timecop.freeze do
    user.generate_token
    expect(user.password_token_time).to eq Time.now
    end
  end

  it 'can find a user with a valid token' do
    user.generate_token
    expect(User.find_by_valid_token(user.password_token)).to eq user
  end

  it 'can\'t find a user with a token over 1 hour in the future' do
    user.generate_token
    Timecop.travel(60 * 60 + 1) do
     expect(User.find_by_valid_token(user.password_token)).to eq nil
    end
  end
end
