require 'peep'

describe Peep do

  let(:subject) { Peep }

  describe "#all" do
    it "starts with an empty list of peeps" do
      expect(subject.all.length).to eq 0
    end
  end
  
end