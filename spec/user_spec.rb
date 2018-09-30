require 'user'

describe User do

  describe '.create' do
    it 'creates a new user' do
      user = User.create(name: 'Bob', username: 'bob123', email: 'bob123@gmail.com', password: 'pa55word')

      expect(user).to be_a User
      expect(user).to respond_to(:id)
      expect(user.name).to eq 'Bob'
    end
  end

end
