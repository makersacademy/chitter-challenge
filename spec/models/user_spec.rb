describe User do
  let!(:user) do
    User.create(name: 'George', email: 'george@curious.com', username: 'george',
                password: 'yellow_hat', password_confirmation: 'yellow_hat')
  end

  it 'authenticates when given a valid email and password' do
    authenticated_user = User.authenticate('george@curious.com', 'yellow_hat')
    expect(authenticated_user).to eq user
  end

  it 'authenticates when given a valid username and password' do
    authenticated_user = User.authenticate('george', 'yellow_hat')
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate when given an invalid password' do
    authenticated_user = User.authenticate('george@curious.com', 'yellowhat')
    expect(authenticated_user).to be_nil
  end
end
