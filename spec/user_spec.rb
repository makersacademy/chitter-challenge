require './app/models/user'

describe User do
  let(:user) do 
    User.create(name: 'Peter', username: 'peter_selie',
                email: 'peterselie@groentje.be', password: '123456',
                password_confirmation: '123456')
  end

  it 'authenticates an email  and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate an email with wrong password' do
    expect(User.authenticate(user.email, 'wrong')).to be_nil
  end
end
