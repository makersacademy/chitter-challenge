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

  it "saves a password recovery token when generated" do
    expect{ user.generate_token }.to change{ user.password_token }
  end

  it "saves a password recovery token time when we generate a token using" do
    Timecop.freeze do
      user.generate_token
      expect(user.password_token_time).to eq Time.new
    end
  end

  it "can find a user with a valid token" do
    user.generate_token
    expect(User.find_by_valid_token(user.password_token)).to eq user
  end

  it "can't find a user with an token that has expired after 1 hour" do
    user.generate_token
    Timecop.travel(60 * 60 + 1) do
      expect(User.find_by_valid_token(user.password_token)).to eq nil
    end 
  end
end
