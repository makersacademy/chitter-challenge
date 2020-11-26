require './lib/user'

describe User do
  let(:testuser) { User.new(id: 1, name: "Testy McTester", username: "Test", email: "test@gmail.com") }

  describe '#initialize' do
    it 'Is an instance of User' do
      expect(testuser).to be_a User
    end

    it "Instances respond to the .username method" do
      expect(testuser.name).to eq "Testy McTester"
    end

    it "Instances respond to the .peep method" do
      expect(testuser.username).to eq "Test"
    end

    it "Instances respond to the .lastmodified method" do
      expect(testuser.email).to eq "test@gmail.com"
    end
  end

  describe '.create' do
    it "Adds a new user to the database" do
      user = User.create(name: "Testy McTester", username: "Test", email: "test@gmail.com", password: 'Test123')
      expect(user.id).not_to eq nil
      expect(user.name).to eq "Testy McTester"
      expect(user.username).to eq 'Test'
      expect(user.email).to eq 'test@gmail.com'
    end
  end

  describe '.find' do
    it 'finds a user by ID' do
      user = User.create(name: "Testy McTester", username: "Test", email: "test@gmail.com", password: 'Test123')
      result = User.find(user.id)
      expect(result.id).to eq user.id
      expect(result.email).to eq user.email
    end
  end
end
