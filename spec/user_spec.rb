require './app/models/user'

describe User do

  let!(:user) do
    User.create(email: 'izzy@example.com', password: 'password1')
  end

  it 'authenticates when given a valid email and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it "doesn't authenticate when given incorrect password" do
    expect(User.authenticate(user.email, 'badpassword')).to be_nil
  end
end
