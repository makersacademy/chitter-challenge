require "user_manager"

describe UserManager do
  let(:catzkorn) { double :user, username: "Catzkorn", email: "ilikecats@ireallylikecats.cat", name: "Charlotte Brandhorst-Satzkorn", password: "donthackmeplease" }

  describe "#logged_in?" do
    it "checks if user is logged in" do
      clear_users_table()
      UserManager.sign_up(catzkorn)
      UserManager.log_in("Catzkorn", "donthackmeplease")
      expect(UserManager.logged_in).to eq "Catzkorn"
    end

    it "returns false if user is not logged in" do
      clear_users_table()
      expect(UserManager.logged_in).to eq ""
      UserManager.log_in("FakeUser", "HahaSuckers")
      expect(UserManager.logged_in).to eq ""
    end
  end

  describe "#signup" do
    it "stores a new user" do
      clear_users_table()
      UserManager.sign_up(catzkorn)
      expect(UserManager.logged_in).to eq "Catzkorn"
    end
  end
end
