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

  it 'saves a password recovery token when we generate a token' do
    expect { user.generate_token }.to change {user.password_token }
  end

  it 'can find a user with a valid token' do
    user.generate_token
    expect(User.find_by_valid_token(user.password_token)).to eq user
  end

  it 'cannot find a user with a token older than 1 hour' do
    user.generate_token
    Timecop.travel(60 * 60 + 1) do
      expect(User.find_by_valid_token(user.password_token)).to eq nil
    end
  end
end
