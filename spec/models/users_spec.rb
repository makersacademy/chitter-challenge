describe User do

  let!(:user) do
    User.create(name: 'Aday Mesa',
                username: 'adaymesa',
                email: 'adaymesagc@gmail.com',
                password: 'yipiyey!',
                password_confirmation: 'yipiyey!')
  end

  it 'Gives an authentification when user gives valid entry details' do
    authenticated_user = User.authenticate(user.username, user.password)
    expect(authenticated_user).to eq user
  end

  it 'Does not authentificate when user gives wrong entry details' do
    expect(User.authenticate(user.username, 'wrong_stupid_password')).to be_nil
  end

end

