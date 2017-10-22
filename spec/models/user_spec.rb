require_relative '../../app/models/user'

describe User do
  
  let!(:user) do
    User.create(email: 'no@email.com', password: 'password', handle: '#ainsley', name: 'Ainsley')
  end

  it 'authenticates when correct credentials given' do
    authenticated_user = User.authenticate(user.email, 'password')
    expect(authenticated_user).to eq user
  end
  it 'fails to authenticate when correct credentials given' do
    authenticated_user = User.authenticate(user.email, 'wrongpassword')
    expect(authenticated_user).to be_nil
  end

end
