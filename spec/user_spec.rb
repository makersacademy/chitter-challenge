require 'user'

describe User do
  it "can create user" do
    test = User.create("test", "test", "test", "test")
    expect(User.all.last).to eq(test)
  end
end
