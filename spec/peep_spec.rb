require 'peep'

describe Peep do
  let(:time) { "2004-10-19 10:23:54" }
  describe ".all" do
    it 'lists all peeps in reverse chronological order' do
      peep = Peep.create(time: "2004-10-19 10:23:54", post: "This is the first peep")
      Peep.create(time: "2004-10-19 10:23:57", post: "This is the second peep")

      peeps = Peep.all

      allow_any_instance_of(Peep).to receive(:time).and_return(time)
      expect(peeps.length).to eq 2
      expect(peeps.first).to be_a Peep
      expect(peeps.first.post).to eq "This is the second peep"
      expect(peeps.first.time).to eq "2004-10-19 10:23:54"
    end
  end

  describe ".create" do
    it 'creates a new peep' do

    end
  end
end
