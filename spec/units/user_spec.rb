require 'models/user'

describe User do
  describe '.create' do
    it "should return a user" do
      user = User.create(name: "Alastair", username: "one",
                         password: "foobar", email: "alastair@fake_email.com")

      expect(user.id).to be_a Integer
      expect(user.name).to eq "Alastair"
      expect(user.username).to eq "one"
      expect(user.email).to eq "alastair@fake_email.com"
    end

    it "should be possible to authenticate a user" do
      user = User.create(name: "Alastair", username: "one",
                         password: "foobar", email: "alastair@fake_email.com")

      expect(user.authenticate "foobar").to be_truthy
      expect(user.authenticate "not_foobar").to be false
    end

    it "shouldn't have an id if the email isn't unique" do
      User.create(name: "Alastair", username: "one",
                  password: "foobar", email: "alastair@fake.com")
      user = User.create(name: "Alastair2", username: "two",
                         password: "foobar", email: "alastair@fake.com")

      expect(user.id).to be_nil
    end

    it "shouldn't have an id if the username isn't unique" do
      User.create(name: "Alastair", username: "one",
                  password: "foobar", email: "alastair@fake.com")
      user = User.create(name: "Alastair2", username: "one",
                         password: "foobar", email: "alastair2@fake.com")

      expect(user.id).to be_nil
    end
  end
end
