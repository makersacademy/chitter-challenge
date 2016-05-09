describe User do
  let!(:user) do
    User.create(email: 'test@test.co.uk',
		password: '1234567',
		name: 'Joe Bloggs',
		user_name: 'JoeB123',
		password_confirmation: '1234567')
  end

  it 'authenticates the password when given a valid username & password' do
    authenticated_user = User.authenticate(user.user_name, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate when given an incorrect password' do
    expect(User.authenticate(user.user_name, 'wrong_stupid_password')).to be_nil
  end
  
end
