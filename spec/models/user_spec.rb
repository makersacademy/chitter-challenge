require_relative '../../app/models/user'

describe User do
  let!(:user) do
    User.create(name: 'User1', email: 'user@email.com', username:'user1', password: '1', password_confirmation: '1')
  end

  it 'authenticates when given a valid username and password' do
    authenticated_user = User.authenticate('user1','1')
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate when an invalid password' do
    expect(User.authenticate('user1','wrong_password')).to be nil
  end
end
