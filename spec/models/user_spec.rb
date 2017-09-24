describe User do

  let!(:user) do
    User.create(name: 'Jack Bauer',
                user_name: 'Jack24',
                email: 'jbauer@ctu.com',
                password: 'damn_it!',
                password_confirmation: 'damn_it!')
  end

  it 'authenticates when given a valid email address and password' do
    authenticated_user = User.authenticate(user.user_name, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate when given an incorrect password' do
    expect(User.authenticate(user.user_name, 'where_is_the_bomb?')).to be_nil
  end

end
