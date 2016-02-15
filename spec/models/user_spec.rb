require './app/models/user'

describe User do
  let!(:user) do
    User.create(
      username: 'amanzano',
      password: 'pass',
      password_confirmation: 'pass',
      email: 'arnold@myemail.com',
      name: 'Arnold Manzano')
  end

  it 'authenticates when given a valid username and password' do
    authenticated_user = User.authenticate(user.username, 'pass')
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate when given an incorrect password' do
    expect(User.authenticate(user.username, 'notpass')).to be_nil
  end

  it 'does not authenticate when given an incorrect username' do
    expect(User.authenticate('otheruser', 'pass')).to be_nil
  end
end
