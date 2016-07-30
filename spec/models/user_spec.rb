require './app/models/user'


describe User do
  let!(:user) do
    User.create(name: 'new user',
                handle: 'new_user1',
                email: 'user@example.com',
                password: 'secret1234',
                password_confirmation: 'secret1234')
  end

  it 'authenticates when given a valid email and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate when given the wrong password' do
    expect(User.authenticate(user.email, 'wrong password')).to eq nil
  end

end
