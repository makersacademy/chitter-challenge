describe User do
  let!(:user) do User.create( email: 'user@email.com',
                      password: 'password',
                      password_confirmation: 'password')
              end

  it 'authenticates with the correct password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq User.first(email: user.email)
  end

  it 'does not authenticate when given an incorrect password' do
    expect(User.authenticate(user.email, 'wrongpassword')).to be_nil
  end

  it "saves a password recovery token when we generate a token" do
    expect{ user.generate_token }.to change{ user.password_token }
  end
end
