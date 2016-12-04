describe User do
  let!(:user) { User.create(email: "keomony@gmail.com", password: "this is password") }

  it "authenticates when given a valid email address and password" do
    authenticated_user = User.authenticate(user.email, "this is password")
    expect(authenticated_user).to eq user
  end

  it "does not authenticate when given an incorrect password" do
    expect(User.authenticate(user.email, "wrong password")).to be_nil
  end
end
