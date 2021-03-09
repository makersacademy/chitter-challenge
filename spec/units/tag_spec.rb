describe Tag do
  
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

  describe '.create' do
    it "stores the user_id and peep_id in database" do
      user = User.create(test_user)
      user2 = User.create(test_user2)
      peep = user.peeps.create(message: "Test Peep")
      tag = peep.tags.create(user_id: user2.id)

      expect(tag.user_id).to eq user2.id
      expect(tag.peep_id).to eq peep.id
    end
  end
end
