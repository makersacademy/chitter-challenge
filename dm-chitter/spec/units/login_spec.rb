require 'Chitter'

describe "Login" do

  subject(:login) {Login.new("tester123", "123abcdef")}

  it "takes in the username and the password as credentials" do
    expect(login.username).to eq "tester123"
    expect(login.password).to eq "123abcdef"
  end

  describe "#correct_credentials?" do
    it "raises an error and prints to the screen if the correct credentials aren't used" do
      expect(login.correct_credentials?).to eq false
      #false because not part of the database currently
    end

  end
end