require_relative "../lib/model/user"

describe User do
  let!(:user) do
    User.create(email:'user@email.com',
    password: '1234',
    password_confirmation: '1234',
    full_name: "bobby bobberson",
    user_name: "bobMan")
  end

  describe "#creation" do
    it "is a valid datamapper model" do
      expect(user).to be_valid
    end
  end

  describe ".authenticate" do
    it "should return user if email exists and has the right password" do
      expect(User.authenticate user.email, user.password).to eq user
    end
    it "should return nil if email exists and has the wrong password" do
      expect(User.authenticate user.email,"CorrectHorse").to be_nil
    end
    it "should return nil if email does not exist but password matches another" do
      expect(User.authenticate "a@ab.com", user.password).to be_nil
    end
  end

end
