describe User do
  let(:params) {
    {
  email: 'test@test.org.uk',
  password: 'passyword',
  password_confirm: 'passyword',
  username: 'tester',
  first_name: 'Tester',
  last_name: 'MacTesterford'
    }
  }
  subject {User.create(params)}

  describe "#authenticate" do
    it "should return true if the password given hashes to match the password_hash" do
      expect(subject.authenticate("passyword")).to eq true
    end
  end
end
