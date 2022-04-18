describe Chitter do

  let (:chitters) {Chitter.all}

  context "when created" do
    it "has am id, peep and created at instances" do
      expect(Chitter.new(id: 'id', peep: 'Peep', created_at: 'created at', user_id: 7)).to be_instance_of(Chitter)
    end
  end
  context ".all" do
    it 'returns all peeps' do
      Chitter.create("Hi", 5)
      Chitter.create("Test", 6)

      expect(chitters.length).to eq 2
      expect(chitters.first).to be_a Chitter
      expect(chitters.first.peep).to eq "Hi"
    end
  end
  context ".create" do
    it "adds a peep" do
      chitter = Chitter.create("Test", 4)
      persisted_data = persisted_data(id: chitter.id)

      expect(chitter).to be_a Chitter
      expect(chitter.user_id).to eq "4"
      expect(chitter.peep).to eq 'Test'
    end
  end
end