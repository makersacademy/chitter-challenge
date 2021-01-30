require 'user'

describe ".create_user" do

  it "stores new users in the database" do
    connection = PG.connect(dbname: 'chitter_test')
    user = User.create_user(username: 'claude', password: 'meow', email: 'petar@simonovic.com')

    expect(user.username).to eq("claude")
    expect(user.password).to eq("meow")
    expect(user.email).to eq("petar@simonovic.com")
  end

end
