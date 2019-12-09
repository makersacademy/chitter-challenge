require 'user'

describe User do
  subject(:user) { User.new(id: 1, username: 'EllieM', email: 'makers@gmail.com', password: 'PASSWORD123') }

  describe '.create' do
    it "should create a new user and add it to the database" do
      expect(user).to be_a User
      expect(user.username).to eq 'EllieM'
      expect(user.email).to eq 'makers@gmail.com'
      expect(user.password).to eq 'PASSWORD123'
    end
  end

end
