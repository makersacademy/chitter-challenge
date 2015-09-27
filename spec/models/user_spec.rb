describe User do
  it 'authenticates when given a valid email address and password' do
    user = create(:user)
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it 'authenticates when given a valid email address and password' do
    user = create(:user, password: 'oops_wrong')
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end
end
