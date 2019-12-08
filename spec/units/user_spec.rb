require 'models/user'

describe User do
  describe '.create' do
    it "should return a user" do
      user = User.create(name: "Alastair", email: "alastair@fake_email.com")

      expect(user.id).to be_a Integer
      expect(user.name).to eq "Alastair"
      expect(user.email).to eq "alastair@fake_email.com"
    end
  end
end
