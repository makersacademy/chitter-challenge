require './app/models/user'

describe User do
  let! :user do
    User.create(username: 'OMGDuke', name: 'Alex',
    email: 'name@email.com', password: '12345',
    password_confirmation: '12345')
  end

  it 'authenticates when given a valid username and password' do
    authenticated_user = User.authenticate(user.username, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate when given an incorrect password' do
    expect(User.authenticate(user.username, 'wrong_pass')).to be_nil
  end
end
