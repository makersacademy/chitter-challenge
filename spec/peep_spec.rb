describe Peep do

  describe '#all' do
    it "should return all peeps created" do
      peep1 = Peep.create("user", "userhandle", "keep on going")
      peep2 = Peep.create("james", "jimbob", "its me")

      expect(Peep.all.last.user).to eql "james"
      expect(Peep.all.last.handle).to eql "jimbob"
      expect(Peep.all.last.message).to eql "its me"
    end
  end
  
end