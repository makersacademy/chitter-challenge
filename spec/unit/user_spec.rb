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
  end
end
