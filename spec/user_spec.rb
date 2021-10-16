require 'user'

describe User do
  describe '.new' do
    it "should create a new user" do
      expect(User.add(username: 'tim456', name: 'tim james', email: 'tim@gmail.com', password: '42jk3l4j2l')[0].username).to eq('tim456')
    end
  end
end