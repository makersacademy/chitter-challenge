require 'peep'
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

    it "encodes input" do
      user = User.create(username: "partario", email: "test@email.com", password: "1234")
      bad_faith_input = Peep.create(body: '<b><a href="http://foo.com/">foo</a></b><img src="bar.jpg">', user_id: user.id)
      expect(bad_faith_input.body).to eq('&lt;b&gt;&lt;a href=&quot;http://foo.com/&quot;&gt;foo&lt;/a&gt;&lt;/b&gt;&lt;img src=&quot;bar.jpg&quot;&gt;')
    end

    it "returns false if there are more than 140 characters" do
      user = User.create(username: "partario", email: "test@email.com", password: "1234")
      too_long = Peep.create(
        body: 'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
               AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
               AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
               AAAAAAAAA',
        user_id: user.id
      )
      expect(too_long).to eq(false)
    end
  end

  describe ".find" do
    it "returns a peep object with the specified ID" do
      user = User.create(username: "partario", email: "test@email.com", password: "1234")
      example_peep = Peep.create(body: "Hello World", user_id: user.id)
      find_result = Peep.find(example_peep.id)
      expect(find_result.id).to eq(example_peep.id)
      expect(find_result.body).to eq(example_peep.body)
    end
  end

  describe ".all" do
    it "returns a list of one peep when there is one entry" do
      user = User.create(username: "partario", email: "test@email.com", password: "1234")
      example_peep = Peep.create(body: "Hello World", user_id: user.id)
      all_peeps = Peep.all
      expect(all_peeps.first.id).to eq(example_peep.id)
      expect(all_peeps.first.body).to eq(example_peep.body)
    end

    it "returns multiple peeps in list with newest first" do
      user = User.create(username: "partario", email: "test@email.com", password: "1234")
      old_peep = Peep.create(body: "Hello World", user_id: user.id)
      new_peep = Peep.create(body: "Hello World", user_id: user.id)
      all_peeps = Peep.all
      expect(all_peeps.first.id).to eq(new_peep.id)
      expect(all_peeps.last.id).to eq(old_peep.id)
    end
  end

  describe ".delete" do
    it "deletes a given peep from the database" do
      user = User.create(username: "partario", email: "test@email.com", password: "1234")
      peep = Peep.create(body: "Hello World", user_id: user.id)
      Peep.delete(peep.id)
      expect(Peep.all).to be_empty
    end
  end
end
