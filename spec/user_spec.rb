describe User do

  let!(:user) do
    User.create(name: 'James', email: 'james@hey.com', username: 'jamesy',
                password: 'qwerty1234',
                password_confirmation: 'qwerty1234')
  end

  it 'a user is correctly authenticated' do
    authenticated_user = User.authenticate('jamesy', 'qwerty1234')
    expect(authenticated_user).to eq user
  end

  it 'an invalid password does not autheticate a user' do
    expect(User.authenticate(user.username, 'hello')).to be_nil
  end

end
