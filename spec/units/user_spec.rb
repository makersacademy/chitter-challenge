require 'user'

describe User do

    describe "#create" do
      it "creates a new user in the table" do
        user = User.create('test@test.com', 'password')
        expect(user.email).to eq 'test@test.com'
      end
    end

  describe '.create' do
    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('password123')
    
      User.create('test@example.com', 'password123')
    end
  end
end