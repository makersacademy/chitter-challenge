
describe User do

  let!(:user) do
    hello = User.create(email: 'rick@astley.com', password: 'nggyu',
               password_confirmation: 'nggyu', username: 'rickroll', name: "Rick Astley")

  end

  it 'authenticates when given a valid email address and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it 'fails to authenticate when given an incorrect password' do
    expect(User.authenticate(user.email, "wrong_password")).to be_nil
  end


end
