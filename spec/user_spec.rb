describe User do

  let!(:user) do
    User.create(username: 'bob123',
								email: 'bob@bob.com',
								name: 'Bob',
		            password: '12345678',
		            password_confirmation: '12345678')
  end

  it 'authenticates when given a valid username and password' do
    authenticated_user = User.authenticate(user.username, user.password)
    expect(authenticated_user).to eq user
  end

end
