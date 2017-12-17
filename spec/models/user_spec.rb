describe User do

  let!(:user) do
    User.create(email: "me@me.com",
                name: "Ellie W",
                username: "ewinnie",
                password: "pass2017",
                password_confirmation: "pass2017")
  end

  it "authenticates user when logging in with valid credentials" do
    authenticated_user = User.authenticate("me@me.com", "pass2017")
    expect(authenticated_user).to eq user
  end

  it "does not authenticate user when logging in with invalid credentials" do
    authenticated_user = User.authenticate("me@me.com", "wrong")
    expect(authenticated_user).to eq nil
  end
end
