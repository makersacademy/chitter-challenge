require "login"
require "signup"
# require "db_helpers"

describe Login do
  describe ".authenticate" do
    it "returns a user given a correct username and password if exists" do
      authenticated_user = Login.authenticate(email: "admin@admin.com", password: "admin")
      expect(authenticated_user.username).to eq "admin"
    end

    it "returns nil given an incorrect email" do
      wrong_email = Login.authenticate(email: "wrong@admin.com", password: "admin")
      expect(wrong_email).to be_nil
    end

    it "returns nil given an incorrect password" do
      wrong_password = Login.authenticate(email: "admin@admin.com", password: "wrong")
      expect(wrong_password).to be_nil
    end
  end
  describe ".find" do
    it "returns the user" do
      username = Login.find(username: "admin")
      expect(username.username).to eq username.username
      expect(username.email).to eq "admin@admin.com"
    end
    it "returns nil if there is no username given" do
      expect(Login.find(username: nil)).to eq nil
    end
  end
end
