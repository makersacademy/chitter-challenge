require 'user'

describe User do

  describe '.create' do

    it "should create a user with a id, username, email and password" do

      user = User.create('Francesca', 'example@example.com', 'password')

      expect(user.id).to eq "2"
      expect(user.username).to eq 'Francesca'
      expect(user.email).to eq 'example@example.com'

    end

    it "hashes the password using BCrypt" do
      expect(BCrypt::Password).to receive(:create).with('password123')

      User.create('James', 'exampleexample@example.com', 'password123')
    end

  end

  describe '.all' do

    it "should return all the users" do
      User.create('George', 'wowzers@example.com', 'password3')

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

  describe '.authenticate' do

    it "gives the correct user if the email and password match" do
      User.create('George', 'test@example.com', 'password123')

      authenticated_user = User.authenticate('test@example.com', 'password123')

      expect(authenticated_user.username).to eq 'George'
    end

    it "returns nil if there is no matching email address" do
      User.create('George', 'test@example.com', 'password123')

      expect(User.authenticate('incorrect@incorrect.com', 'password123')).to eq nil
    end

    it "returns nil if the password is incorrect" do
      User.create('George', 'test@example.com', 'password123')

      expect(User.authenticate('test@example.com', 'incorrect')).to eq nil
    end

  end

end
