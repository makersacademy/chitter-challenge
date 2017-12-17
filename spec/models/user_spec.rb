describe User do
  let!(:user) do
    User.create(email: 'example@coldmail.com', name: 'George', username: 'Chunks', password: 'password', password_confirmation: 'password')
  end

  it 'authenticates when given correct details' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it 'doesnt authenticate if given incorrect details' do
    expect(User.authenticate(user.email, 'nope')).to be_nil
  end
end
