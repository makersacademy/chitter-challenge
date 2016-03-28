describe User do
  let(:user){create(:user)}

  describe "#authenticate" do
    # let(:user){create(:user)}
    it "authenticates when given a valid email and password" do
      expect(User.authenticate(user.email, '123456')).to eq user
    end
    it 'does not authenticate when given an incorrect password' do
      expect(User.authenticate(user.email, 'wrong_stupid_password')).to be_nil
    end
  end
end
