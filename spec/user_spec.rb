describe User do
  let!(:user) do
    User.create(name: "Mike",
                username: "Mickey-boy",
                email: 'mike@mike.com',
                password: '1234')
  end

  it "authenticates a user when signing in" do
    authenticated_user = User.authenticate(email: 'mike@mike.com', password: '1234')
    expect(authenticated_user).to eq user
  end

  it "can't sign in if password wrong" do
    expect(User.authenticate(email: 'mike@mike.com', password: 'wrong!!')).to be_nil
  end




end
