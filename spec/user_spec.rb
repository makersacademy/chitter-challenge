require_relative '../app/models/user'

describe User do

  let(:email) {"test@test.com"}
  let!(:user){ User.create(email: email, username: "test",
                name: "Testy Man", password: "passw0rd")}

  it "should authenticate itself" do
    expect(User.authenticate("test", "passw0rd")).to eq user
  end
end
