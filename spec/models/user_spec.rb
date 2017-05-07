
describe User do
  let!(:user) do
    User.create(username: "troi99",
                email: "dtroi@starfleet.com",
                name: "Deanna Troi",
                password: "imzadi",
                password_confirmation: "imzadi")
  end

  it 'authenticates when given a valid username and password' do
    authenticated_user = User.authenticate(user.username, user.password)
    expect(authenticated_user.username).to eq user.username
  end

  it 'does not authenticate when given the incorrect password' do
    expect(User.authenticate(user.username, 'wrong_password')).to be_nil
  end
end
