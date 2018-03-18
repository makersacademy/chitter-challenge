require 'user'

describe User do

  describe '.create' do

    it "should create a user with a id, username, email and password" do

      user = User.create('Francesca', 'example@example.com', 'password')

      expect(user.id).to eq "1"
      expect(user.username).to eq 'Francesca'
      expect(user.email).to eq 'example@example.com'
      expect(user.password).to eq 'password'

    end

  end

  describe '.all' do

    it "should return all the users" do
      user = User.create('George', 'wowzers@example.com', 'password3')

      expect(User.all[0].username).to eq "George"
    end

  end

  describe '.find' do

    it "should find a user by its id" do
      user = User.create('Charles', 'wowow@example.com', 'password123')

      expect(User.find(user.id).username).to eq 'Charles'
    end

    it "should return nil if no ID given" do
      expect(User.find(nil)).to eq nil
    end
  end

end
