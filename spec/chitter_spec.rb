require "chitter" 

describe Chitter do 
 
   describe "#all" do 
    it "Gets all entries from the database" do 
      user = User.create("Test User", "test@test.com", "pass123")
      Chitter.create("New post in chitter", user.id, user.name)
      Chitter.create("New post in chitter", user.id, user.name)
      expect(Chitter.all.entries.length).to be > 0 
    end
  end

  describe "#create" do 
    it "create a new entry in the database" do 
      user = User.create("Test User", "test@test.com", "pass123")
      new_post = Chitter.create("New post in chitter", user.id, user.name)
      expect(Chitter.all.first).to eq new_post.first
    end
  end

  describe "#reverse_all" do 
    it "Gets all entries in reverse order" do
      user = User.create("Test User", "test@test.com", "pass123")
      Chitter.create("First post in chitter", user.id, user.name)
      new_post = Chitter.create("Second post in chitter", user.id, user.name)
      expect(Chitter.reverse_all.first).to eq new_post.entries.first 
    end
  end

  describe "#user_name" do 
    it "Display the user name" do 
      user = User.create("Test User", "test@test.com", "pass123")
      Chitter.create("Post with a name", user.id, user.name)
      expect(Chitter.all.first["user_name"]).to eq "Test User"
    end
  end


end