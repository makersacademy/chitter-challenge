require './app/models/user.rb'

describe User do
  let!(:user) do
    User.create(user_name: 'Testee', email: 'test@meme.com',
    password: 'password_test', password_confirmation: 'password_test')
  end

  it 'authenticates when given a valid email address' do
    authenticated_user = User.authenticate(user.user_name, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate when given an incorrect password' do
    expect(User.authenticate(user.email, 'wrong_stupid_password')).to be_nil
  end

end
