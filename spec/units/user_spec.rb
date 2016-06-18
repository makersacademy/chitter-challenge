describe User do
  describe "#authenticate" do
    let(:password) { "password123" }
    let!(:user) do
      described_class.create(
        username: "vannio",
        name: "Van",
        email: "van@email.com",
        password: password,
        password_confirm: password
      )
    end

    it "returns a valid user if password is authenticated" do
      expect(described_class.authenticate(user.username, password)).to eq(user)
    end

    it "returns nothing if password is incorrect" do
      expect(described_class.authenticate(user.username, "wrong_password")).to be_nil
    end
  end
end
