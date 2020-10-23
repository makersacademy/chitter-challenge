require "user"

describe User do
  describe "#new" do
    it "creates a user" do
      clear_users_table()
      test_user = User.new("Catzkorn", "ilikecats@ireallylikecats.cat", "Charlotte Brandhorst-Satzkorn", "donthackmeplease")
      expect(test_user.username).to eq "Catzkorn"
      expect(test_user.email).to eq "ilikecats@ireallylikecats.cat"
      expect(test_user.name).to eq "Charlotte Brandhorst-Satzkorn"
      expect(test_user.password).to eq "donthackmeplease"
    end
  end
end
