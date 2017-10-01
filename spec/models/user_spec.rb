describe User do

  let!(:user) do
    User.create(
      name: 'Jennifer Bacon',
      username: 'jennyb',
      email: 'jenniferbacon@hotmail.com',
      password: 'secret1234')
  end

  it 'authenticates when given a valid email address and password' do
    authenticated_user = User.authenticate("jenniferbacon@hotmail.com", "secret1234")
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate when given an incorrect password' do
    expect(User.authenticate("jenniferbacon@hotmail.com", 'wrong_stupid_password')).to be_nil
  end

end
