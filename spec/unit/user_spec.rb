require 'user'
describe User do
  describe ".create" do
    it "should create a user" do
      user = User.create(email: 'bernard@fake.com',username: 'bernardleanse', password: 'password')
      expect(user.email).to eq 'bernard@fake.com'
      expect(user.username).to eq 'bernardleanse'
      expect(user.password).to eq 'password'
    end
  end

  describe ".all" do
    it "should display all users" do
      User.create(email: 'bernard@fake.com',username: 'bernardleanse', password: 'password')
      users = User.all
      expect(users.first).to be_a User
      expect(users.first.username).to eq 'bernardleanse'
    end
  end

  describe '.find' do
    it 'should return nil if no id supplied' do
      expect(User.find(id: nil)).to eq nil  
    end
      
    it 'should find a user by the id' do
      user = User.create(email: 'bernard@fake.com',username: 'bernardleanse', password: 'password')
      expect(User.find(id: user.id).username).to eq 'bernardleanse'
    end
  end
end
