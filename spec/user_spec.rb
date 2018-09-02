describe User do
  describe "#sign_up" do
    it "can sign up for an account" do
      user1 = User.signup('Sam', 'Laz', 's@h.com', 'ram')
      expect(user1.name).to eq 'Sam'
    end
  end
end
