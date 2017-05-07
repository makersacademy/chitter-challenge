describe User do

  let!(:user) do
    User.create(email: 'propeeper@email.com',
                username: 'manicstreetpeeper',
                name: 'Yono',
                password: 'shh999',
                password_confirmation: 'shh999')
  end

  it 'authenticates when given a valid email address and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

end
