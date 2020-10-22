require 'peep'

describe Peep do
  subject(:peep) { described_class.new(id: "99", username: "@leo", body: "Woof!", posted_on: "2020-10-10 12:12:12") }

  describe "#initialize" do
    it "has username, body and time" do
      expect(peep.id).to eq "99"
      expect(peep.username).to eq "@leo"
      expect(peep.body).to eq "Woof!"
      expect(peep.posted_on).to eq "2020-10-10 12:12:12"
    end
  end

  describe '#all' do
    it "returns an array of peeps" do
      peeps = Peep.all

      expect(peeps).to be_a Array
    end
  end
end
