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
  end

  context "#add_peep" do
    it "adds the message to the database" do
      ChitterHandler.add_peep "The sample message has been added"
      peeps = ChitterHandler.retrieve_peeps.map do |peep|
        peep[:text]
      end
      expect(peeps).to include "The sample message has been added"
    end
  end
end
