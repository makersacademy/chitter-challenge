require 'peep'

describe Peep do

  describe '.all' do
    it 'displays all peeps' do
      Peep.create(body: "Test Peep")
      Peep.create(body: "Another test")
      test_peep = Peep.create(body: "A third test")

      all_peeps = Peep.all

      expect(all_peeps.length).to eq 3
      expect(all_peeps.first).to be_a Peep
      expect(all_peeps.first.id).to eq test_peep.id
      expect(all_peeps.first.body).to eq test_peep.body
    end
  end

  describe '.create' do
    it "creates a new peep" do
      message = Peep.create(body: "test")

      expect(message).to be_a Peep
      expect(message.body).to eq "test"
    end
  end
end
