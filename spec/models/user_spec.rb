describe User do
  
  let!(:user) do
    User.create(name: 'banana man',
                email: 'banana@example.com', 
                username: 'bananaman1',
                password: 'banana123', 
                password_confirmation: 'banana123'
                )
  end

  it 'authenticates when given a valid username and password' do
    authenticated_user = User.authenticate(user.username, user.password)
    expect(authenticated_user).to eq user
  end


end