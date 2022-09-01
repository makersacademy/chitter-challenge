require 'user'

describe User do
  it "should create a new User when .create is called" do
    user = User.create(name: "James", username: "JamesMay123", password: "Topgear123")

    expect(user.name).to eq("James")
    expect(user.username).to eq("JamesMay123")
  end 
end