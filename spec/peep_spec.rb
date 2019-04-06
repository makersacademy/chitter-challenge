describe Peep do
  describe '.allPeepsInReverseOrder' do
    it 'returns the peeps in reverse order' do
      user1 = User.create name: "User1",
                          username: "User1",
                          email: "user1@example.com",
                          password: "password"
      user2 = User.create name: "User2",
                          username: "User2",
                          email: "user2@example.com",
                          password: "password"
      peep1 = Peep.create content: "1st peep", user: user1
      peep2 = Peep.create content: "2nd peep", user: user2
      peep3 = Peep.create content: "3rd peep", user: user1

      allPeeps = Peep.all
      reversePeeps = Peep.allPeepsInReverseOrder
      expect(reversePeeps.first.content).to eq "3rd peep"
    end
  end
end
