require 'pry'

describe User do

  let!(:user) do
    User.create(username: "test_name",
                email: "test@email.com",
                password: "password1",
                password_confirmation: "password1")
  end

  it "authenticates a valid email address and password" do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq(user)

  end

  it "does not authenticate an invalid email address or password" do
    expect(User.authenticate(user.email, "wrong_password")).to be_nil
  end

end
