require_relative '../../lib/user'

describe User do
  context ".signup" do
    it 'is called on the User class expecting 4 arguments' do
      expect(described_class).to respond_to(:signup).with(4).arguments
    end

    it 'inserts into the database the name, username, email and password of the new user' do
      described_class.signup()
    end
  end
end