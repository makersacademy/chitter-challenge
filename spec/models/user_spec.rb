describe User do
  let!(:user) do
    User.create(name: 'MAKER', password: '1234',
                password_confirmation: '1234')
  end

  it 'authenticates when given a valid name and password' do
    authenticated_user = User.authenticate(user.name, user.password)
    expect(authenticated_user).to eq user
  end
end
