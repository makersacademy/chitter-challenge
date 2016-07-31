require './app/models/user'

describe Peep do
  it "peep saved to a logged in user" do
    user = User.create(email: "hulk@gmail.com", password: "smash", name: "Bob", username: "bob123")
    expect(Peep.count).to eq 0
    peep = Peep.create(content: "Hey", username: user.username, name: user.name)
    peep.save
    expect(Peep.count).to eq 1
  end
end
