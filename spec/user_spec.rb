
require './app/models/user'

describe User do

  let!(:user) do

    User.create(name: 'user1',
      username: 'user1',
      email: 'hi@email.com',
      password: 'test')
  end

  it 'Fails authentication when details incorrect' do
  expect(User.authenticate(user.username, 'incorrect')).to be_nil

  end

end
