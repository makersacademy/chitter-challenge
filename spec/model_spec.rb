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

  context "#create_user" do
    it "adds the user to the database" do
      ChitterHandler.create_user(
        username: "UserName1",
        email: "email@allemails.org",
        name: "This is my Name",
        password: "password1"
      )
      user_record = ChitterHandler.find_user(username: "UserName1")
      expect(user_record[:email]).to eq "email@allemails.org"
      expect(user_record[:name]).to eq "This is my Name"
      expect(user_record[:password]).to eq "password1"
    end
  end
end
