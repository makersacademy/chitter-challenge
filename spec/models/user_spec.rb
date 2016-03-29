describe User do

  let!(:user) do
    User.create(name:"Paul", username:"Bottycrap", email:"paul@paul.com",
      password:"password",password_confirmation:"password")

  end

  it 'authenticates a user with valid username and password' do
    authenticated_user = User.authenticate(user.username, user.password)
    expect(authenticated_user).to eq user
  end

  it 'fails authentication if username/password is invalid' do
    authenticated_user = User.authenticate(user.username, "wrong")
    expect(authenticated_user).to eq nil
  end

end
