describe User do

  it 'authenticates when given a valid email address and password' do
    user = create :user
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate when given an incorrect password' do
    user = create :user
    expect(User.authenticate(user.email, 'wrong_password')).to be_nil
  end
end