require_relative '../../app/models/user'

describe User do

  let!(:user) do
    User.create(username: "LadyMacker123", email: "ladymacbeth@dunsinane.com", password: "damn3dSp0t")
  end

  it "authenticates if username and password are correct" do
    authenticated_user = User.authenticate(user.username, user.password)
    expect(authenticated_user).to eq user
  end

  it "won't authenticate if password is incorrect" do
    expect(User.authenticate(user.username, "incorrect_password")).to eq nil
  end

  it "won't authenticate if username is incorrect" do
    expect(User.authenticate("incorrect username", user.password)).to eq nil
  end

end
