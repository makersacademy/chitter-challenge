describe User do

  let!(:user) do
      User.create(email: 'test@test.com', name: 'test guy', username: 'testguy123', password: 'secret1234')
    end

  it 'authenticates when given a valid email and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate when given an incorrect password' do
    authenticated_user = User.authenticate(user.email, 'wrong')
    expect(authenticated_user).to be_nil
  end

end
