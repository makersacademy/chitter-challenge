describe User do
  let!(:user) do
    User.create(name: "Bill",
                email: "bill@email.com",
                username: "billy",
                password: "test")
  end

  it "authenticates when given a valid username and password" do
    authenticated_user = User.authenticate(user.username, user.password)
    expect(authenticated_user).to eq user
  end

  it "does not authenticate when given an invalid username and password" do
    expect(User.authenticate(user.email, 'wrong_password')).to be_nil
  end

end
