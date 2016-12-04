require './app/models/user'
describe User do
  it "authenticates correct user credentials" do
    DatabaseCleaner.clean
    user = User.create(username: "Pea", email: "pea@pod.com", password: "pealander", password_confirmation: "pealander")
    expect(User.login("Pea", "pealander")).to eq true
  end

  it "rejects incorrect user credentials" do
    DatabaseCleaner.clean
    user = User.create(username: "Pea", email: "pea@pod.com", password: "pealander", password_confirmation: "pealander")
    expect(User.login("Pea", "pealanderz")).to eq false  
  end
end
