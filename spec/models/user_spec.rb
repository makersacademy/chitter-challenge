

describe User do

  let!(:user) do
    User.create(user_name: 'Alan', password: 'password1')
  end

  it 'authenticates when given a valid user name and password' do
    authenticated_user = User.authenticate(user.user_name, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate when given an incorrect password' do
  expect(User.authenticate(user.user_name, 'wrong_stupid_password')).to be_nil
end

end
