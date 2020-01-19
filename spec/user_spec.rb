require 'user'


describe User do

  describe ".create" do
    it "creates a new user" do
      user = User.create('test@test.com', 'password')
      expect(user.email).to eq('test@test.com')
    end
 
    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('password')
      User.create('test@test.com', 'password')
    end
  end

end