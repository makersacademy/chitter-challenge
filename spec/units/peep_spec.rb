describe Peep do

  test_user = {
    name: "User",
    email: "Email",
    username: "Username",
    password: "password"
  }

  test_user2 = {
    name: "User2",
    email: "Email2",
    username: "Username2",
    password: "password"
  }
  
  test_user3 = {
    name: "User3",
    email: "Email3",
    username: "Username3",
    password: "password"
  }

  describe 'tagged_users' do
    it "returns array of tagged users" do
      user = User.create(test_user) # owner of peep
      user2 = User.create(test_user2) # tagged in peep
      user3 = User.create(test_user3) # tagged in peep

      peep = user.peeps.create(message: "Peep tagging user2 and user3")
      tag = peep.tags.create(user_id: user2.id)
      tag2 = peep.tags.create(user_id: user3.id)

      expect(peep.tagged_users).to eq [user2, user3]
    end
  end
end
