require './app/models/user'

describe User do

let(:new_user) { User.create(first_name: "Lisa", last_name: "Simpson", username: "Lisa", email: "ilovemangos@email.com", password: "sweetandjuicy")}

describe "Authenticating user" do
  it "Authenticates valid user email and password" do
    new_user
    expect(User.authenticate("ilovemangos@email.com", "sweetandjuicy")).to eq new_user
  end

  it "Does not authenticate when given invalid user password" do
    new_user
    expect(User.authenticate("ilovemangos@email.com", "sourlemons")).to be_nil
  end

  it "Does not authenticate when given invalid user email" do
    new_user
    expect(User.authenticate("ihatemangos@email.com", "sweetandjuicy")).to be_nil
  end
end

end
