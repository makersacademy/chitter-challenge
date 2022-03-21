require 'user'

describe User do

  context 'signup' do
    it "creates new user upon signup" do
      user = User.signup(
        firstname: 'Archie', 
        lastname: "Bear", 
        username: "archbear", 
        email: "iamarchie@gmail.com", 
        password: "hello123"
      )
      expect(user.id).not_to be_nil
    end

    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('hello123')
      User.signup(
        firstname: 'Archie', 
        lastname: "Bear", 
        username: "archbear", 
        email: "iamarchie@gmail.com", 
        password: "hello123"
      )
    end
  end
end
