require 'users'

describe Users do
  describe '#create' do
    it 'creates a new user' do
      user = Users.create('test@test.com', 'password', 'John Doe', 'J')
      expect(user).to be_a Users
      expect(user.name).to eq 'John Doe'
    end
  end
end
