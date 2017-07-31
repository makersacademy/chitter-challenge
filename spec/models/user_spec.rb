describe User do

    let!(:user) do
      User.create(name: 'user',
                  user_name: 'user123',
                  email_address: 'user@user.com',
                  password: 'pasword123',
                  password_confirmation: 'pasword123')
    end

  it 'authenticates when given a valid email address and password' do
    authenticated_user = User.authenticate(user.email_address, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate when given an incorrect password' do
    expect(User.authenticate(user.email_address, 'password321')).to be_nil
  end

end
