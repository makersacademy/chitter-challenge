require_relative '../../app/models/user'

describe User do

  let!(:user) do
    User.create(name: 'Test Test',
                username: 'testtest',
                email: 'test@test.com',
                password: 'test',
                password_confirmation: 'test')
  end

  it 'authenticates when given a valid email address and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate when given an incorrect password' do
    expect(User.authenticate(user.email, 'incorrect_password')).to be_nil
  end

end
