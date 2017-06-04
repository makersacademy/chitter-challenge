describe User do

  let!(:user) do
    User.create(email: 'kavita@example.com', password: 'makers',
                password_confirmation: 'makers', name: 'Kavita',
                username: 'kkavita92')
  end

  it 'user can log in with valid email address and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it 'user cannot log in with incorrect password' do
    expect(User.authenticate(user.email, 'wrong_stupid_password')).to be_nil
  end

end
