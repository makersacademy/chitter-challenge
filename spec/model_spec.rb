describe ChitterHandler do
  context "#retrieve_peeps" do
    it "returns the stored peeps" do
      default_peep1 = ChitterHandler::DEFAULT_PEEPS[0]
      default_peep2 = ChitterHandler::DEFAULT_PEEPS[1]
      peeps = ChitterHandler.retrieve_peeps.map do |peep|
        peep[:text]
      end
      expect(peeps).to include default_peep1, default_peep2
    end

    it "returns the results ordered by timestamp" do
      ChitterHandler.add_peep "A new peep"
      ChitterHandler.add_peep "Another new peep"
      peeps = ChitterHandler.retrieve_peeps.map do |peep|
        peep[:datetime]
      end
      (1...peeps.length).each do |index|
        expect(peeps[index]).to be > peeps[index - 1]
      end
    end
  end

  context "#add_peep" do
    it "adds the message to the database" do
      ChitterHandler.add_peep "The sample message has been added"
      peeps = ChitterHandler.retrieve_peeps.map do |peep|
        peep[:text]
      end
      expect(peeps).to include "The sample message has been added"
    end

    it "includes the username when provided" do
      ChitterHandler.add_peep "This message is from a User", "IAmUser"
      test_peep = ChitterHandler.retrieve_peeps.find { |i| i[:text] == "This message is from a User" }
      expect(test_peep[:username]).to eq "IAmUser"
    end
  end
end
