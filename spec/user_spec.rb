require_relative '../app/models/user'
describe User do
  it "returns user if password is correct" do
    user =  User.create(email: "s.yalniz@hotmail.de", password: "password123",
       password_confirmation: "password123",
    username: "syalniz", name: "Samed Yalniz")
    expect(User.authenticate("syalniz","password123")).to eq user
  end

  it "return nil if password is incorrect" do
    user =  User.create(email: "s.yalniz@hotmail.de", password: "password123",
       password_confirmation: "password123",
    username: "syalniz", name: "Samed Yalniz")
    expect(User.authenticate("syalniz", "password122")).to eq nil
  end 
end
