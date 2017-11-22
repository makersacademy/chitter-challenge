
describe User do
  let(:user) do
    User.create(email: 'fake1@email.com',
                password: '12345',
                password_confirmation: '12345',
                name: 'Lewis',
                username: 'Lwz')
  end

  it 'authenticates a valid email and password' do
    auth_user = User.authenticate(user.email, user.password)
    expect(auth_user).to eq(user)
  end
  it 'does not authenticate when given incorrect password' do
    expect(User.authenticate(user.email, 'wrong_password')).to be_nil
  end
end
