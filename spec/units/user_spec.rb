require 'user'
describe User do


    let!(:user) { User.create(
                 :name => "Beatrice",
                 :username => "beacourage",
                 :email => "bea@bea.com",
                 :password => "hello12345"
                  )}


  context "#self.authenticate" do
    it 'user can only login with correct email and password' do
      expect(User.authenticate("bea@bea.com", "hello12345")).to eq user
    end

    it "rejects a non existent user" do
      expect(User.authenticate("random.com", "lalala")).to eq nil
    end

    it "User exists, rejects incorrect password" do
      expect(User.authenticate('bea@bea.com', 'lame')).to eq nil
    end
  end

  context "#signup" do
    it "Same email address can't be used twice" do
        # binding.pry
        user = User.create(email: 'bea@bea.com')
        expect(user.errors.first[0]).to eq "Email is already taken"
        # expect(User.create(email: 'bea@bea.com')).to eq nil
      end

  end
end
