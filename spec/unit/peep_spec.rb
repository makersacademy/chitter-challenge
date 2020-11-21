require 'Peep'
require 'date'
require 'user'

describe Peep do
  it "initializes with id, posting time, body & author" do
    post = Peep.new(id: 1, time: DateTime.now, body: "Hello World", author: "partario")
    expect(post.id).to eq(1)
    expect(post.time.day).to eq(DateTime.now.day)
    expect(post.body).to eq("Hello World")
    expect(post.author).to eq("partario")
  end

  describe ".create" do
    it "adds a Peep to the database, returning a Peep object" do
      user = User.create(username: "partario", email: "test@email.com", password: "1234")
      example_peep = Peep.create(body: "Hello World", user_id: user.id)
      expect(example_peep.body).to eq("Hello World")
      expect(example_peep.time.day).to eq(DateTime.now.day)
    end

    it "ensures peep objects created return the name of the author" do
      user = User.create(username: "partario", email: "test@email.com", password: "1234")
      example_peep = Peep.create(body: "Hello World", user_id: user.id)
      expect(example_peep.author).to eq(user.username)
    end
  end
end