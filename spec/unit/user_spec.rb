require "./lib/user.rb"
require "./spec/web_helper.rb"

describe User do 
  user_hash = { email: "john_doe@yahoo.com", 
  name: "John Doe",
  username: "johndoe",
  password: "running123"
  }

  it "saves the new user via new method and then finds it using find" do
    test_connect_and_clean_table(:users)
    described_class.new(user_hash)
    created_row = described_class.find(:johndoe)
    expect(created_row.first[:name]).to eq("John Doe")
  end

  it "saves the new user via new method and then finds it using get for user authentification" do
    test_connect_and_clean_table(:users)
    described_class.new(user_hash)
    created_row = described_class.get(:johndoe, :running123)
    expect(created_row.first[:name]).to eq("John Doe")
  end

end
