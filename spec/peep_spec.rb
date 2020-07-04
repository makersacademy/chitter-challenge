describe Peep do
  context 'a new Peep is created' do
    describe '#initialize' do
      it "should receive 3 arguments" do
        user = "me"
        handle = "thebest"
        message = "Keep on going"
        
        peep = Peep.new(user: user, handle: handle, message: message)

        expect(peep.user).to eq(user)
        expect(peep.handle).to eq(handle)
        expect(peep.message).to eq(message)
      end
    end
  end

  describe '#all' do
    it "should return all peeps created" do
      peep1 = Peep.new(user: "user", handle: "userhandle", message: "keep on going")
      peep2 = Peep.new(user: "james", handle: "jimbob", message: "it's me")

      expect(Peep.all.last.user).to eql peep2.user
      expect(Peep.all.last.handle).to eql peep2.handle
      expect(Peep.all.last.message).to eql peep2.message
    end
  end
  
end