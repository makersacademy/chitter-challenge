require 'peep'

describe Peep do
  subject(:peep) { described_class.new("@leo", "Woof!", "2020-10-10 12:12:12") }

  describe "#initialize" do
    it "has username, body and time" do
      expect(peep).to have_attibutes(username: "Leo", body:"Woof!", time: "2020-10-10 12:12:12")
    end
  end
end
