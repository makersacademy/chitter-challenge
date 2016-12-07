require './app/models/user'
describe User do
  before do
    DatabaseCleaner.clean
    user = User.create(username: "Pea", email: "pea@pod.com", password: "pealander", password_confirmation: "pealander")
  end

  it "authenticates correct user credentials" do
    expect(User.login("Pea", "pealander")).to be_kind_of(User)
  end

  it "rejects incorrect user credentials" do
    expect(User.login("Pea", "pealanderz")).to eq false
  end

  it "checks if a user exists" do
    expect(User.exists?("Pea", "pod@pea.com")).to eq "username"
    expect(User.exists?("Pen", "pod@pea.com")).to eq false
  end
end
