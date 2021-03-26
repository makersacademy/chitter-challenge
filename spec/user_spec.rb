require 'user'

describe Peep do
  describe 'Contains the data for a user' do
    it "has an id, username, password and email address" do
      user = User.new(user_id: '1', username: 'snowy', password: 'password1', email: 'snowy@gmail.com')
      expect(user).to respond_to(:username)
    end
  end
end
