describe User do

  let!(:user) do
    User.create(email: 'marco@test.com', password: 'secret1234',
               password_confirmation: 'secret1234')
  end

  it '#authenticate - when given a valid email address and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it '#authenticate - when given an incorrect password' do
    expect(User.authenticate(user.email, 'wrong_stupid_password')).to be_nil
  end

  it "#generate_token - saves a password token when a token is generated" do
     expect{user.generate_token}.to change{user.password_token}
  end

  it "#generate_token - saves a password token time when a token is generated" do
    Timecop.freeze do
      user.generate_token
      expect(user.password_token_time).to eq Time.now
    end
  end

  it '#find_by_valid_token - find a user with a valid token' do
    user.generate_token
    expect(User.find_by_valid_token(user.password_token)).to eq user
  end

  it '#find_by_valid_token - can\'t find a user with a token over 1 hour' do
    user.generate_token
    Timecop.travel(60 * 60 + 1) do
      expect(User.find_by_valid_token(user.password_token)).to eq nil
    end
  end
end
