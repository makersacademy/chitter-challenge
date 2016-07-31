describe User do

  let!(:user) do
    User.create(email: 'byron@fierce.com',
                name: 'Byron',
                user_name: 'byron',
                password: 'lakes',
                password_confirmation: 'lakes')
  end

  it 'authenticates when given a valid email adddress and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate when given an incorrect password' do
    expect(User.authenticate(user.email, 'bad_password')).to be_nil
  end
end
