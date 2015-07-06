require 'byebug'

describe User do
  let!(:user) do
    User.create(email:    'test@test.com',
                username: 'rabbit',
                password: 'secret1234')
  end

  it 'authenticates when given a valid username and password' do
    authenticated_user = User.authenticate_user(user.username, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate when given an incorrect password' do
    expect(User.authenticate_user(user.username, 'wrongwrong')).to be_nil
  end
end
