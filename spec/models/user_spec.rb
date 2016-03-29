describe User do
  let!(:user) do
    User.create(email: 'cersei@house_lannister.co.we', password: 'jamie',
             password_confirmation: 'jamie')
  end

  it 'authenticates when given a valid email address and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it 'doesnt match user in database' do
    expect(User.authenticate(user.email, 'robert')).to be_nil
  end
end
