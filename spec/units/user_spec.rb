require 'user'

describe ".create_user" do
  it "stores new users in the database" do
    connection = PG.connect(dbname: 'chitter_test')
    user = User.create_user(username: 'claude', password: 'meow', email: 'petar@simonovic.com')

    # expect(peep).to be_a Peep
    # expect(peep.time).to eq('12.09')
    # expect(peep.date).to eq('2021-01-30')
    expect(user.username).to eq("claude")
    expect(user.password).to eq("meow")
    expect(user.email).to eq("petar@simonovic.com")
  end

end
