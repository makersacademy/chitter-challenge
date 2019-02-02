require 'passhash_handler'

describe PassHashHandler do

  describe "#generate_hash" do

    it 'generates a hash from a password' do
      test = PassHashHandler.new.generate_hash('agoodpassword')
      expect(test).to_not eq('agoodpassword')
    end
  end
  describe '#check_against_hash' do
    before(:each) do
      @myhash = PassHashHandler.new.generate_hash('agoodpassword')
    end
    it "returns true if a password matches a hash" do
      expect(PassHashHandler.new.check_against_hash('agoodpassword', @myhash)).to eq(true)
    end
    it "returns false if a password doesn't match it's hash" do
      expect(PassHashHandler.new.check_against_hash('abadpassword', @myhash)).to eq(false)
    end
  end
end
