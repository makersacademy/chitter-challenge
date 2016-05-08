require_relative '../app/models/user'

describe User do

  let!(:user) do
    User.create(name: 'macey', username: 'macebake', email: 'test@test.com', password: 'coolpwd')
  end

  it 'does not authenticate when given an invalid username and password' do
    authenticated_user = User.authenticate('yay', 'nope')
    expect(authenticated_user).not_to eq user
  end

  it 'authenticates when given a valid username and password' do
    authenticated_user = User.authenticate(user.username, user.password)
    expect(authenticated_user).to eq user
  end

end
