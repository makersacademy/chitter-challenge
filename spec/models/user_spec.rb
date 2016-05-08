require "./app/models/user"

describe User do

  let!(:user) do
    User.create(name: 'Chris',
                username: 'chrischit',
                email: 'chris@email.com',
                password: 'password',
                password_confirmation: 'password')
  end

  it 'authenticates when given a valid email address and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate when given an incorrect password' do
    expect(User.authenticate(user.email, 'wrong_stupid_password')).to be_nil
  end

end