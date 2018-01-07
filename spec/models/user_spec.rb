require './app/models/user'

describe User do

  let!(:user) do User.create(user_name: 'nikolaos',
                user_email: 'nikolaos@example.com',
                password: 'test1234',
                password_confirmation: 'test1234')
  end

  it 'authenticates when given a valid email address and password' do
    authenticated_user = User.authenticate(user.user_email, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate when given an incorrect password' do
    expect(User.authenticate(user.user_email, 'wrong_stupid_password')).to be_nil
  end

end
