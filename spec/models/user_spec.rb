require './app/models/user'

describe User do
  let!(:user) do
    User.create(username: 'user1',
                email: 'hi@email.com',
                password: 'test',
                password_confirmation: 'test')
  end

  it 'Authenticates user when signing in' do
    authenticated_user = User.authenticate(user.username, user.password)
    expect(authenticated_user).to eq user
  end

  it 'Fails authentication when details incorrect' do
    expect(User.authenticate(user.username, 'incorrect')).to be_nil
  end
end
