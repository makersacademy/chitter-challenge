require './app/models/user'

describe User do
  let!(:user) do
    User.create(name: 'tester', username: 'alias', email: 'test@test.com',
    password: 'secret1234', password_confirmation: 'secret1234')
  end

  it 'Authenticates a user' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate when given an incorrect password' do
    expect(User.authenticate(user.email, 'wrong_stupid_password')).to be_nil
  end
end
