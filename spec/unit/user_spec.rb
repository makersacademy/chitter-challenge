require 'user'

describe User do

  describe '::create' do
    it 'creates a new instance of user' do
      new_user = User.create(name: "Jim", username: "KingJim", email: "jim@hotmail.com", password: "password")
      expect(new_user).to be_a User
      expect(new_user.name).to eq("Jim")
      expect(new_user.username).to eq("KingJim")
    end
  end

  describe '::find_by_username' do
    it 'finds the user object associated with the username passed to it' do
      new_user = User.create(name: "Jim", username: "KingJim", email: "jim@hotmail.com", password: "password")
      found_user = User.find_by_username("KingJim")
      expect(found_user.name).to eq(new_user.name)
    end
  end


end
