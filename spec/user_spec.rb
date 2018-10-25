describe 'User' do

  describe '.create' do
    it 'creates a new user' do
      user = User.create(name: 'Chloe Verity', username: 'chloeverity123', emailaddress: 'chloeverity@hotmail.co.uk', password: 'ilovemrcuddles')
      expect(user).to be_a User
    end
  end

  subject(:user) { User.create(name: 'Chloe Verity', username: 'chloeverity123', emailaddress: 'chloeverity@hotmail.co.uk', password: 'ilovemrcuddles') }

  describe "#name" do
    it "returns full name of user" do
      expect(user.name).to eq 'Chloe Verity'
    end
  end

  describe "#username" do
    it "returns username of user" do
      expect(user.username).to eq 'chloeverity123'
    end
  end

  describe "#emailaddress" do
    it "returns email of user" do
      expect(user.emailaddress).to eq 'chloeverity@hotmail.co.uk'
    end
  end

  describe "#password" do
    it "returns password of user" do
      expect(user.password).to eq 'ilovemrcuddles'
    end
  end

end
