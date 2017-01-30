describe User do

  let!(:user) do
    User.create(email: 'eric@example.com', password: 'password1',
               password_confirmation: 'password1')
  end

  it 'authenticate valid email and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it 'don\'t authenticate when incorrect password' do
    expect(User.authenticate(user.email, 'not_erics_password')).to be_nil
  end

end
