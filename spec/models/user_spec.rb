require './app/models/user'

describe User do

  let!(:user){create :user}

  it 'authenticates when given a valid email address and password' do
    authenticated_user = User.authenticate(user.username, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate when given an invalid password' do
    expect(User.authenticate(user.username, 'wrong_stupid_password')).to be_nil
  end

end