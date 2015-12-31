describe User do

  let!(:user) do
    User.create(name: 'Edward Kerry',
                user_name: 'Ed',
                email: 'edwardkerry@gmail.com',
                password: 'password123',
                password_confirmation: 'password123')
  end

  it 'authenticates valid user name and password' do
    authenticated = User.authenticate(user.email, user.password)
    expect(authenticated).to eq user
  end

  it 'does not authenticate invalid user name and password' do
    expect(User.authenticate(user.email, 'badpass')).to eq nil
  end

end
