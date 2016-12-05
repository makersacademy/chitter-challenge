describe User do
  let!(:user) { User.create(email: "keomony@gmail.com",
                            password: "this is password",
                            password_confirmation: "this is password") }

  it "authenticates when given a valid email address and password" do
    authenticated_user = User.authenticate("keomony@gmail.com", "this is password")
    expect(authenticated_user).to eq user
  end

  it "does not authenticate when given an incorrect password" do
    expect(User.authenticate("keomony@gmail.com", "wrong password")).to be_nil
  end
end
