require "signup"
require "chitter"
require "db_helpers"

describe Signup do
  describe ".create" do
    it "creates a new user" do
      user = instance_double(Signup)
      allow(user).to receive(:username).and_return("admin")
      allow(user).to receive(:name).and_return("admin")
      allow(user).to receive(:lastname).and_return("admin")
      allow(user).to receive(:email).and_return("admin@admin.com")
      allow(user).to receive(:password).and_return("admin")
      expect(user.username).to eq "admin"
      expect(user.name).to eq "admin"
      expect(user.lastname).to eq "admin"
      expect(user.email).to eq "admin@admin.com"
      expect(user.password).to eq "admin"
    end
  end
end
