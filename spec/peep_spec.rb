require "./app/models/peep"

describe Peep do
  let(:subject) { described_class.new }
  let(:user) { double(:user, peeps: []) }

  describe "initialize" do
    it "can be initialized" do
      expect(subject).to be_an_instance_of(Peep)
    end
    it "has a message" do
      user.peeps << Peep.create(message:"test")
      expect(user.peeps.last.message).to eq("test")
    end
  end
end
