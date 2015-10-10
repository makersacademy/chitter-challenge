describe User do
  it 'authenticates when given the correct email and password' do
    user = create :user
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end
end
